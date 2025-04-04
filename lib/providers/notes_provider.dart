import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/note_model.dart';
// Riverpod State Provider
final notesProvider = StateNotifierProvider<NotesNotifier, List<Note>>((ref) {
  return NotesNotifier();
});

class NotesNotifier extends StateNotifier<List<Note>> {
  NotesNotifier() : super([]);

  void addNote(String title, String content) {
    final newNote = Note(id: Uuid().v4(), title: title, content: content);
    state = [...state, newNote];
  }

  void updateNote(String id, String title, String content) {
    state = state.map((note) => note.id == id ? Note(id: id, title: title, content: content) : note).toList();
  }

  void deleteNote(String id) {
    state = state.where((note) => note.id != id).toList();
  }
}