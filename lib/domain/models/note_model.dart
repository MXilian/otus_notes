base class NoteModel {
  final int id;
  final String title;
  final String content;

  const NoteModel({required this.id, required this.title, this.content = ''});
}
