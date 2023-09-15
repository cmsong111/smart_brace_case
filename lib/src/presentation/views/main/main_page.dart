import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("메인화면"),
      ),
      body: const Center(
        child: Text("메인화면 페이지"),
      ),
    );
  }
}
