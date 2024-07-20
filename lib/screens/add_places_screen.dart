import 'package:favourite_places_app/providers/user_places.dart';
import 'package:favourite_places_app/widgets/image_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlacesForm extends ConsumerStatefulWidget {
  const AddPlacesForm({super.key});

  @override
  ConsumerState<AddPlacesForm> createState() => _AddPlacesFormState();
}

class _AddPlacesFormState extends ConsumerState<AddPlacesForm> {
  final _titleController = TextEditingController();

  void _savePlace() {
    if (_titleController.text.isEmpty) return;
    ref.read(userPlacesProvider.notifier).addPlace(_titleController.text);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new place"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            // Image Input
            const InputImageWidget(),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(
                CupertinoIcons.add,
                size: 20,
              ),
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Add place",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
