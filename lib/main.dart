import 'package:flutter/material.dart';
import 'package:otus_notes/domain/models/note_model.dart';
import 'package:otus_notes/domain/notes_handler.dart';
import 'package:otus_notes/presentation/screens/notes_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otus notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: MultiProvider(
        providers: [
          Provider<NotesHandler>(
            create: (_) => NotesHandler(),
            dispose: (_, handler) => handler.dispose(),
          ),
          StreamProvider<List<NoteModel>>(
            create: (context) => context.read<NotesHandler>().notesStream,
            initialData: [],
          ),
        ],
        child: NotesScreen(),
      ),
    );
  }
}
