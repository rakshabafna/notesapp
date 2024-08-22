import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_model.dart';

class CreateNotes extends StatefulWidget {
  const CreateNotes({super.key, required this.onNewNoteCreated});
  final Function(Note) onNewNoteCreated;

  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(fontSize: 30),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Title"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: bodyController,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Type something..."),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            return;
          }
          if (bodyController.text.isEmpty) {
            return;
          }
          final note =
              Note(title: titleController.text, body: bodyController.text);

          widget.onNewNoteCreated(note);
          Navigator.of(context).pop();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
