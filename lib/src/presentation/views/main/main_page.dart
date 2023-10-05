import 'package:flutter/material.dart';
import 'package:smart_brace_case/src/presentation/views/main/dental_paga.dart';
import 'package:smart_brace_case/src/presentation/views/main/home_page.dart';
import 'package:smart_brace_case/src/presentation/views/main/info_page.dart';
import 'package:smart_brace_case/src/presentation/views/main/my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const HomePage(),
    const DentalPage(),
    const InfomationPage(),
    const MyProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services), label: "치과"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "정보"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "내정보"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
