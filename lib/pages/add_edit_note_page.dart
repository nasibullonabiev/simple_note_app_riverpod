import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/note_model.dart';
import '../providers/notes_provider.dart';

// Add/Edit Note Page
class AddEditNotePage extends ConsumerStatefulWidget {
  final Note? note;
  const AddEditNotePage({super.key, this.note});

  @override
  ConsumerState<AddEditNotePage> createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends ConsumerState<AddEditNotePage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.note == null ? "Add Note" : "Edit Note")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: "Title")),
            TextField(controller: _contentController, decoration: InputDecoration(labelText: "Content")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                final content = _contentController.text;
                if (widget.note == null) {
                  ref.read(notesProvider.notifier).addNote(title, content);
                } else {
                  ref.read(notesProvider.notifier).updateNote(widget.note!.id, title, content);
                }
                Navigator.pop(context);
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}