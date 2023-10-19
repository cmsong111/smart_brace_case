import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/src/presentation/providers/timer_provider.dart';

class MyTimer extends StatelessWidget {
  const MyTimer({super.key});

  @override
  Widget build(BuildContext context) {
    TimerProvider timerProvider =
        Provider.of<TimerProvider>(context, listen: true);
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("오늘 착용 시간"),
          ChangeNotifierProvider(
            create: (BuildContext context) => TimerProvider(),
            child: Text(
              "${timerProvider.lastTick}초",
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
