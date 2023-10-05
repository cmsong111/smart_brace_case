import 'package:flutter/material.dart';

class InfomationPage extends StatelessWidget {
  const InfomationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("정보화면"),
      ),
      body: const Center(
        child: Text("정보화면 페이지"),
      ),
    );
  }
}
