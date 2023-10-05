import 'package:flutter/material.dart';

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
          Stack(
            children: [
              Image.network(
                  "https://www.shhosp.co.kr/common/front/group/images/meidcal/bg_dentistry.jpg"),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("김남주 치과",
                    style: TextStyle(fontSize: 30, shadows: [
                      Shadow(color: Colors.white, blurRadius: 10)
                    ])),
              ),
            ],
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
          )
        ],
      ),
    );
  }
}
