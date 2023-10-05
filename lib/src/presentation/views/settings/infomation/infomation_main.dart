import 'package:flutter/material.dart';
import 'package:smart_brace_case/src/core/resources/app_constant.dart';

class InfomationMainPage extends StatefulWidget {
  const InfomationMainPage({super.key});

  @override
  State<InfomationMainPage> createState() => _InfomationMainPageState();
}

class _InfomationMainPageState extends State<InfomationMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("설정")),
      body: Center(
          child: ListView(
        children: [
          ListTile(
            title: const Text("이용약관"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("위치 기반 서비스 이용약관"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("개인정보 처리방침"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("오픈소스 라이선스"),
            onTap: () {
              Navigator.pushNamed(context, AppRoute.openSource);
            },
          ),
        ],
      )),
    );
  }
}
