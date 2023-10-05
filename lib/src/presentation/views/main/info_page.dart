import 'package:flutter/material.dart';

class InfomationPage extends StatelessWidget {
  const InfomationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("치아 정보"),
      ),
      body: ListView.separated(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("제목 $index",
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_sharp)),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: Column(
                              children: [
                                const Text("이미지"),
                                Image.network(
                                  "https://picsum.photos/100/100?random=$i",
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}
