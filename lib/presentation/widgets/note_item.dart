import 'package:flutter/material.dart';
import 'package:otus_notes/domain/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    required this.noteModel,
    this.isExpanded = false,
    this.onExpansionChanged,
    super.key,
  });

  final NoteModel noteModel;
  final bool isExpanded;
  final ValueChanged<bool>? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: ExpansionTile(
        key: ValueKey(noteModel.id),
        leading: const Icon(Icons.sticky_note_2_outlined),
        title: Text(noteModel.title),
        subtitle:
            isExpanded
                ? null
                : Text(
                  noteModel.content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
        initiallyExpanded: isExpanded,
        onExpansionChanged: onExpansionChanged,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(noteModel.content),
            ),
          ),
        ],
      ),
    );
  }
}
