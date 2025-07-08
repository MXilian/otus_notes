import 'dart:async';

import 'package:otus_notes/domain/models/note_model.dart';
import 'package:rxdart/subjects.dart';

class NotesHandler {
  final _notesStreamBS = BehaviorSubject<List<NoteModel>>.seeded([]);

  Stream<List<NoteModel>> get notesStream => _notesStreamBS.stream;

  void addNote(NoteModel note) {
    final newList = [..._notesStreamBS.value];
    newList.add(note);
    _notesStreamBS.add(newList);
  }

  void dispose() {
    _notesStreamBS.close();
  }
}
