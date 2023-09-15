import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/src/presentation/providers/firebase_auth_service.dart';

Logger logger = Logger();

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseAuthService _authService =
        Provider.of<FirebaseAuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("로그인"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "아이디",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _pwController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "비밀번호",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _authService.signInWithEmailAndPassword(
                      email: _idController.text,
                      password: _pwController.text,
                    );
                  },
                  child: const Text("로그인"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("회원가입"),
                ),
              ],
            ),
            SignInButton(
              Buttons.Google,
              onPressed: () async {
                logger.d("Google Login button pressed");
                await _authService.SignInWithGoogle();
                logger.i(_authService.currentUser!.email);
              },
            ),
            SignInButton(
              Buttons.Apple,
              onPressed: () {
                logger.d("Apple Login button pressed");
              },
            )
          ],
        ),
      ),
    );
  }
}
