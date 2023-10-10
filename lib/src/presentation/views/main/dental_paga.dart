import 'package:flutter/material.dart';
import 'package:smart_brace_case/src/core/resources/app_constant.dart';

class DentalPage extends StatefulWidget {
  const DentalPage({super.key});

  @override
  State<DentalPage> createState() => _DentalPageState();
}

class _DentalPageState extends State<DentalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("치과")),
      body: ListView(
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 1,
            margin: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Image.asset("assets/images/bg_dentistry.jpg"),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "김남주 치과",
                    style: TextStyle(
                      fontSize: 30,
                      shadows: [Shadow(color: Colors.white, blurRadius: 10)],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
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
                      Navigator.pushNamed(context, AppRoute.article,
                          arguments: 1);
                    },
                  ),
                  ListTile(
                    title: const Text("제목2"),
                    subtitle: const Text("내용2"),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.article,
                          arguments: 2);
                    },
                  ),
                  ListTile(
                    title: const Text("제목3"),
                    subtitle: const Text("내용3"),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.article,
                          arguments: 3);
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "문의사항",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_sharp)),
                    ],
                  ),
                  ListTile(
                    title: const Text("제목"),
                    subtitle: const Text("내용"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("제목"),
                    subtitle: const Text("내용"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("제목"),
                    subtitle: const Text("내용"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
