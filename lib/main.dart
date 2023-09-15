import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:smart_brace_case/src/config/theme.dart';
import 'package:smart_brace_case/src/core/resources/app_constant.dart';

import 'src/config/route.dart';
import 'src/presentation/providers/counts.dart';

void main() {
  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<Counts>(
            create: (BuildContext context) => Counts()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mainTheme,
      routes: appRoute,
      initialRoute: AppRoute.home,
    );
  }
}
