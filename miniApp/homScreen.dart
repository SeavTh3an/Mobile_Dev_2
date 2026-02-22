import 'package:flutter/material.dart';
import 'statistic_screen.dart';
import 'tap_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum CardType { red, blue }

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final Map<CardType, int> _tapCounts = {CardType.red: 0, CardType.blue: 0};

  void _incrementTap(CardType type) {
    setState(() {
      _tapCounts[type] = _tapCounts[type]++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screen = [
      TapScreen(tapCounts: _tapCounts, onTap: _incrementTap),
      StatisticsScreen(tapCounts: _tapCounts),
    ];

    return Scaffold(
      body: screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.touch_app), label: "Tap"),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart),
            label: "Statistic",
          ),
        ],
      ),
    );
  }
}
