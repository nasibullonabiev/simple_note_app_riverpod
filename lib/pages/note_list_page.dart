import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/notes_provider.dart';
import 'add_edit_note_page.dart';
import 'note_detail_page.dart';

// Note List Page
class NoteListPage extends ConsumerWidget {
  const NoteListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,

        title: Text("Notes"),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.green.shade200,
            child: ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteDetailPage(note: note),
                    ),
                  ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed:
                    () => ref.read(notesProvider.notifier).deleteNote(note.id),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddEditNotePage()),
            ),
        child: Icon(Icons.add),
      ),
    );
  }
}
