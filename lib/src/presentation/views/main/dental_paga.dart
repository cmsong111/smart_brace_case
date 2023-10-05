import 'package:flutter/material.dart';

class DentalPage extends StatefulWidget {
  const DentalPage({super.key});

  @override
  State<DentalPage> createState() => _DentalPageState();
}

class _DentalPageState extends State<DentalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("치과")),
      body: const Center(
        child: Text("치과 페이지"),
      ),
    );
  }
}
