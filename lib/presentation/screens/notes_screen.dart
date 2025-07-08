import 'package:flutter/material.dart';
import 'package:otus_notes/domain/models/note_model.dart';
import 'package:otus_notes/domain/notes_handler.dart';
import 'package:otus_notes/presentation/widgets/add_note_sheet.dart';
import 'package:otus_notes/presentation/widgets/notes_list.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  Future<void> _onAddNotePressed() async {
    final maybeNote = await _showCreateNoteSheet();
    if (maybeNote != null && mounted) {
      final handler = context.read<NotesHandler>();
      handler.addNote(maybeNote);
    }
  }

  Future<NoteModel?> _showCreateNoteSheet() async {
    return showModalBottomSheet<NoteModel>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return AddNoteSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Otus заметки')),
      body: NotesList(),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: _onAddNotePressed,
          shape: const CircleBorder(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
