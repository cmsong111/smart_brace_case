class Notice {
  final String content;
  final String title;
  DateTime createAt;
  List<String> reply;

  Notice({
    required this.content,
    required this.title,
    required this.createAt,
    required this.reply,
  });
}
