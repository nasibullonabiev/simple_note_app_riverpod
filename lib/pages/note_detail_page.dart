import 'package:flutter/material.dart';

import '../models/note_model.dart';
import 'add_edit_note_page.dart';
// Note Detail Page
class NoteDetailPage extends StatelessWidget {
  final Note note;
  const NoteDetailPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(note.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(note.content),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddEditNotePage(note: note)),
        ),
      ),
    );
  }
}