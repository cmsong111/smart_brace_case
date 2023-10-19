import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/src/presentation/providers/timer_provider.dart';

class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    TimerProvider timerProvider =
        Provider.of<TimerProvider>(context, listen: true);
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("교정장치 착용 여부"),
          ChangeNotifierProvider<TimerProvider>(
            create: (BuildContext context) => TimerProvider(),
            child: Switch(
              value: timerProvider.time.isActive,
              onChanged: (bool value) {
                print("changed value : {$value}");
                if (value) {
                  timerProvider.startTimer();
                } else {
                  timerProvider.stopTimer();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
