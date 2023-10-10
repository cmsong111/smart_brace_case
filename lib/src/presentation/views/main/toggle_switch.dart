import 'package:flutter/material.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("교정장치 착용 여부"),
          Switch(
            value: value,
            onChanged: (bool value) {
              setState(() {
                this.value = value;
              });
            },
          )
        ],
      ),
    );
  }
}
