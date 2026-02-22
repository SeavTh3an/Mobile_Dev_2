import 'package:flutter/material.dart';
import 'homScreen.dart';

class StatisticsScreen extends StatelessWidget {
  final Map<CardType, int> tapCounts;

  const StatisticsScreen({super.key, required this.tapCounts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Statistic")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Red Taps: ${tapCounts[CardType.red]}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Blue Taps: ${tapCounts[CardType.blue]}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
