import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/src/presentation/providers/firebase_auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwCheckController = TextEditingController();
  late final FirebaseAuthService googleProvider;

  @override
  void initState() {
    super.initState();
    googleProvider = Provider.of<FirebaseAuthService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원가입"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _idController,
                validator: FormBuilderValidators.email(errorText: "이메일 형식"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "아이디",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _pwController,
                validator: FormBuilderValidators.minLength<String>(8,
                    errorText: "8자리 이상"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "비밀번호",
                ),
                // obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _pwCheckController,
                validator: (value) {
                  if (value != _pwController.text) {
                    return "비밀번호가 일치하지 않습니다.";
                  } else {
                    return null;
                  }
                },
                // obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "비밀번호 확인",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    googleProvider.createUserWithEmailAndPassword(
                        email: _idController.text,
                        password: _pwController.text);
                    Fluttertoast.showToast(msg: "회원가입 성공");
                  } else {
                    Fluttertoast.showToast(msg: "회원가입 실패");
                  }
                },
                child: const Text("회원가입"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("취소"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
