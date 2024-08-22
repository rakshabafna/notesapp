import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/screens/widgets/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.index, required this.onNoteDeleted,required this.color});
  final Note note;
  final int index;
   final Function(int) onNoteDeleted;
   final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteView(note: note, index: index, onNoteDeleted:onNoteDeleted,)));
      },
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.body,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                note.title,
                style: const TextStyle(
                  fontSize: 20,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
