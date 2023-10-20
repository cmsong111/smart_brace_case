import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/src/core/resources/app_constant.dart';
import 'package:smart_brace_case/src/presentation/providers/firebase_auth_service.dart';

class RegisterUserInputPage extends StatefulWidget {
  const RegisterUserInputPage({super.key});

  @override
  State<RegisterUserInputPage> createState() => _RegisterUserInputPageState();
}

class _RegisterUserInputPageState extends State<RegisterUserInputPage> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FirebaseAuthService _authService =
        Provider.of<FirebaseAuthService>(context, listen: false);

    TextEditingController _nameController = TextEditingController();
    TextEditingController _photoUrlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("회원가입"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 00),
        child: ListView(
          children: [
            Form(
              key: key,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "이름",
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _photoUrlController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "유저 사진",
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  // TODO
                  _authService.currentUser!.updateDisplayName(
                      _nameController.text.trim().toString());

                  _authService.currentUser!.updatePhotoURL(
                      _photoUrlController.text.trim().toString());
                }
              },
              child: Text("저장"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoute.main);
              },
              child: Text("다음"),
            ),
          ],
        ),
      ),
    );
  }
}
