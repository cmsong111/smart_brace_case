import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({super.key});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        const ListTile(
          title: Text("오늘의 체크리스트"),
        ),
        ListTile(
          title: const Text("1. 교정장치 세척"),
          trailing: Checkbox(
            value: _isChecked1,
            onChanged: (bool? value) {
              setState(() {
                _isChecked1 = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text("2. 교정장치 착용"),
          trailing: Checkbox(
            value: _isChecked2,
            onChanged: (bool? value) {
              setState(() {
                _isChecked2 = value!;
              });
            },
          ),
        ),
      ],
    ));
  }
}
