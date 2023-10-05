import 'package:flutter/material.dart';
import 'package:smart_brace_case/src/core/resources/app_constant.dart';

class SettingMainPage extends StatefulWidget {
  const SettingMainPage({super.key});

  @override
  State<SettingMainPage> createState() => _SettingMainPageState();
}

class _SettingMainPageState extends State<SettingMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("설정")),
      body: Center(
          child: ListView(
        children: [
          ListTile(
            title: const Text("내정보"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("내 기기 관리"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Smart Brace Case 정보"),
            onTap: () {
              Navigator.pushNamed(context, AppRoute.settingInfomaion);
            },
          ),
          ListTile(
            title: const Text("로그아웃"),
            onTap: () {},
          ),
        ],
      )),
    );
  }
}
