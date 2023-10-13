import 'package:flutter/material.dart';

class FindMyIotPage extends StatelessWidget {
  const FindMyIotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("내 IoT 찾기"),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/naver_map.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            child: Icon(
              Icons.push_pin,
              size: 50,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
