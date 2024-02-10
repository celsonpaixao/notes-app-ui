import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:notes_app/model/note.dart';

class NoteController extends ChangeNotifier {
  List<Note> _notes = [];

  UnmodifiableListView<Note> get nota => UnmodifiableListView(_notes);

  void AddNote({required Note note}) {
    _notes.add(note);
    notifyListeners();
  }
  void RemoveNote({required Note note}) {
    _notes.remove(note);
    notifyListeners();
  }
}
