import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("공지사항")),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("제목 $index"),
            subtitle: Text("내용 $index"),
            onTap: () {
              Navigator.pushNamed(context, "/detail", arguments: index);
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Divider(),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
