import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/src/core/resources/app_constant.dart';

import '../../providers/counts.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times'),
            ChangeNotifierProvider(
              create: (BuildContext context) => Counts(),
              child: Text(
                '${context.watch<Counts>().count}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.login);
              },
              child: const Text('로그인'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.main);
              },
              child: const Text("메인페이지"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Counts>().add();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
