import 'package:flutter/material.dart';
import 'package:smart_brace_case/src/core/resources/app_constant.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("내정보"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.setting);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const Center(
        child: Text("내정보 페이지"),
      ),
    );
  }
}
