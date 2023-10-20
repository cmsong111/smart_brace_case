import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_brace_case/src/core/resources/app_constant.dart';

class Last3ArticleCard extends StatelessWidget {
  const Last3ArticleCard({super.key, required this.firebasePath});

  final String firebasePath;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection(firebasePath)
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        print(element.data());
      });
    });

    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "공지사항",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.notice);
                  },
                  icon: const Icon(Icons.arrow_forward_sharp)),
            ],
          ),
          ListTile(
            title: const Text("제목1"),
            subtitle: const Text("내용1"),
            onTap: () {
              Navigator.pushNamed(context, AppRoute.article, arguments: 1);
            },
          ),
          ListTile(
            title: const Text("제목2"),
            subtitle: const Text("내용2"),
            onTap: () {
              Navigator.pushNamed(context, AppRoute.article, arguments: 2);
            },
          ),
          ListTile(
            title: const Text("제목3"),
            subtitle: const Text("내용3"),
            onTap: () {
              Navigator.pushNamed(context, AppRoute.article, arguments: 3);
            },
          ),
        ],
      ),
    );
  }
}
