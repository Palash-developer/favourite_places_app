import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class InputImageWidget extends StatefulWidget {
  const InputImageWidget({super.key, required this.onSelectImg});

  final void Function(File image) onSelectImg;

  @override
  State<InputImageWidget> createState() => _InputImageWidgetState();
}

class _InputImageWidgetState extends State<InputImageWidget> {
  File? _imageFile;
  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImg =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedImg == null) return;
    setState(() {
      _imageFile = File(pickedImg.path);
    });
    widget.onSelectImg(_imageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity * 0.8,
      height: 180,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: _imageFile != null
          ? GestureDetector(
              onTap: _takePicture,
              child: Image.file(
                _imageFile!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            )
          : TextButton.icon(
              onPressed: _takePicture,
              label: Text(
                "Take Picture",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              icon: const Icon(CupertinoIcons.camera),
            ),
    );
  }
}
