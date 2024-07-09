import 'dart:io';

import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/widgets/Images.dart';
import 'package:favorite_places/widgets/Loction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFavPlace extends ConsumerStatefulWidget {
  const AddFavPlace({super.key});

  @override
  ConsumerState<AddFavPlace> createState() => _AddFavPlaceState();
}

class _AddFavPlaceState extends ConsumerState<AddFavPlace> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  void savePlace() {
    final enteredData = _titleController.text;
    if (enteredData.isEmpty || _selectedImage == null) {
      return;
    }
    ref
        .read(userPlacesProvide.notifier)
        .addPlaces(enteredData, _selectedImage!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new place"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          TextField(
            controller: _titleController,
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
            decoration: const InputDecoration(labelText: "Title"),
          ),
          const SizedBox(height: 12),
          ImageInput(
            onPickimage: (image) {
              _selectedImage = image;
            },
          ),
          const SizedBox(height: 12),
          LocationInput(),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: savePlace,
            icon: const Icon(Icons.add),
            label: const Text("Add Place"),
          )
        ]),
      ),
    );
  }
}
