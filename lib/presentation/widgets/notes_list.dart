import 'package:flutter/material.dart';
import 'package:otus_notes/domain/models/note_model.dart';
import 'package:otus_notes/presentation/widgets/note_item.dart';
import 'package:provider/provider.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  int? _expandedNoteId;

  void _onNoteTap(int noteId, bool isExpanding) {
    setState(() {
      _expandedNoteId = isExpanding ? noteId : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final notes = context.watch<List<NoteModel>>();

    if (notes.isEmpty) {
      return const _EmptyList();
    }

    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final model = notes[index];

        return NoteItem(
          noteModel: model,
          onExpansionChanged:
              (isExpanding) => _onNoteTap(model.id, isExpanding),
          isExpanded: model.id == _expandedNoteId,
        );
      },
    );
  }
}

class _EmptyList extends StatelessWidget {
  const _EmptyList();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notes, size: 48.0, color: Colors.grey),
          SizedBox(height: 16.0),
          Text(
            'Пока заметок нет',
            style: TextStyle(fontSize: 18.0, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
