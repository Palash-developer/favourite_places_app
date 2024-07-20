import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputImageWidget extends StatefulWidget {
  const InputImageWidget({super.key});

  @override
  State<InputImageWidget> createState() => _InputImageWidgetState();
}

class _InputImageWidgetState extends State<InputImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: TextButton.icon(
        onPressed: () {},
        label: const Text("Take Picture"),
        icon: const Icon(CupertinoIcons.camera),
      ),
    );
  }
}
