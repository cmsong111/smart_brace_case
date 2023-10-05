import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/src/presentation/providers/firebase_auth_service.dart';

class AccountMainPage extends StatefulWidget {
  const AccountMainPage({super.key});

  @override
  State<AccountMainPage> createState() => _AccountMainPageState();
}

class _AccountMainPageState extends State<AccountMainPage> {
  late FirebaseAuthService auth;

  @override
  void initState() {
    super.initState();
    auth = Provider.of<FirebaseAuthService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("설정"),
        ),
        body: ListView(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(auth.currentUser!.photoURL!),
            ),
            ListTile(
              title: const Text("이름"),
              subtitle: Text(auth.currentUser!.displayName!),
            ),
            ListTile(
              title: const Text("이메일"),
              subtitle: Text(auth.currentUser!.email!),
            ),
            ListTile(
              title: const Text("전화번호"),
              subtitle: Text(auth.currentUser!.phoneNumber ?? "미기입"),
            ),
          ],
        ));
  }
}
