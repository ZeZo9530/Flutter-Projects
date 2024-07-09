import 'package:flutter/material.dart';

class AddPlayer extends StatefulWidget {
  const AddPlayer({super.key, required this.onAddPlayer});

  final void Function(String name) onAddPlayer;
  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitData() {
    if (_nameController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Invalid Inputs"),
          content: const Text("Please enter valid data"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
    } else {
      setState(
        () {
          widget.onAddPlayer(_nameController.text);
          Navigator.pop(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            label: Text("Add Team"),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: _submitData,
              child: const Text("Save"),
            ),
            const SizedBox(
              width: 5,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
          ],
        )
      ]),
    );
  }
}
