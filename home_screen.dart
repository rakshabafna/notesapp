import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/screens/create_notes.dart';
import 'package:notes_app/screens/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = List.empty(growable: true);
  final List<Color> colors = [
    Colors.purple[200]!,
    Colors.red[200]!,
    Colors.green[200]!,
    Colors.orange[200]!,
    Colors.blue[200]!,
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Notes",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
        ),
      )),
      body:  Column(
        children: [
          Center(
            child: Image.asset(
            'assets/images/notes.png',
            fit:BoxFit.cover,
            ),
          ),
          Expanded(
            child:ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteCard(
                note: notes[index], index: index, onNoteDeleted: onNoteDeleted, color: colors[index % colors.length],);
          }
          ),
          ),
        ],
      ),
    
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateNotes(
                    onNewNoteCreated: onNewNoteCreated,
                  )));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 211, 5, 211),
      ),
    );
  }

  void onNewNoteCreated(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
