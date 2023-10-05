import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:smart_brace_case/src/config/theme.dart';
import 'package:smart_brace_case/src/core/resources/app_constant.dart';
import 'package:smart_brace_case/src/presentation/providers/firebase_auth_service.dart';

import 'src/config/route.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<FirebaseAuthService>(
            create: (BuildContext context) => FirebaseAuthService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initial = AppRoute.login;

  @override
  void initState() {
    super.initState();

    // 로그인 여부에 따라서 초기화면을 결정합니다.
    FirebaseAuthService auth =
        Provider.of<FirebaseAuthService>(context, listen: false);
    auth.currentUser == null
        ? initial = AppRoute.login
        : initial = AppRoute.main;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mainTheme,
      darkTheme: ThemeData.dark(),
      routes: appRoute,
      initialRoute: initial,
    );
  }
}
