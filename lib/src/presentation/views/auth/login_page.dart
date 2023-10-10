import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/src/core/resources/app_constant.dart';
import 'package:smart_brace_case/src/presentation/providers/firebase_auth_service.dart';

Logger logger = Logger();

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: _idController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "아이디",
                      ),
                      validator: FormBuilderValidators.email(
                        errorText: "이메일 형식",
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _pwController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "비밀번호",
                    ),
                    obscureText: true,
                    validator: FormBuilderValidators.minLength<String>(8,
                        errorText: "8자리 이상"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    logger.d("Login button pressed");

                    if (_formKey.currentState!.validate()) {
                      await _authService.signInWithEmailAndPassword(
                        email: _idController.text,
                        password: _pwController.text,
                      );
                      Fluttertoast.showToast(
                          msg:
                              "로그인 성공\n로그인된 유저:${_authService.currentUser!.email}");
                      logger.i(_authService.currentUser!.email);
                    }
                  },
                  child: const Text("로그인"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.register);
                  },
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
                if (_authService.currentUser != null) {
                  Navigator.popAndPushNamed(context, AppRoute.main);
                }
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
