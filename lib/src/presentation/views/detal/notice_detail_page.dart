import 'package:flutter/material.dart';

class NoticeDetailPage extends StatefulWidget {
  const NoticeDetailPage({super.key});

  @override
  State<NoticeDetailPage> createState() => _NoticeDetailPageState();
}

class _NoticeDetailPageState extends State<NoticeDetailPage> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(title: const Text("공지사항")),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("제목 $index",
                style: const TextStyle(
                    fontSize: 30,
                    shadows: [Shadow(color: Colors.white, blurRadius: 10)])),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 500,
              child: Text("내용 $index"),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("댓글 $index"),
                subtitle: Text("작성자 $index"),
              );
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Divider(),
              );
            },
            itemCount: 3,
          ),
        ],
      ),
    );
  }
}
