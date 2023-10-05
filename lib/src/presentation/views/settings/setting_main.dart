import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/src/core/resources/app_constant.dart';
import 'package:smart_brace_case/src/presentation/providers/firebase_auth_service.dart';

class SettingMainPage extends StatefulWidget {
  const SettingMainPage({super.key});

  @override
  State<SettingMainPage> createState() => _SettingMainPageState();
}

class _SettingMainPageState extends State<SettingMainPage> {
  late FirebaseAuthService auth;

  @override
  void initState() {
    super.initState();
    auth = Provider.of<FirebaseAuthService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("설정")),
      body: Center(
          child: ListView(
        children: [
          ListTile(
            title: const Text("내정보"),
            onTap: () {
              Navigator.pushNamed(context, AppRoute.settingAccount);
            },
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
            onTap: () async {
              await showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("로그아웃"),
                    content: const Text("로그아웃 하시겠습니까?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("취소"),
                      ),
                      TextButton(
                        onPressed: () async {
                          await auth.signOut();
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppRoute.login, (route) => false);
                        },
                        child: const Text("확인"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      )),
    );
  }
}
