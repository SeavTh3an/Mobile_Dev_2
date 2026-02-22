import 'package:flutter/material.dart';
import 'tap_button.dart';
import 'homScreen.dart';

class TapScreen extends StatelessWidget {
  final Map<CardType, int> tapCounts;
  final void Function(CardType) onTap;
  const TapScreen({super.key, required this.onTap, required this.tapCounts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Color Taps")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            TapButton(
              type: CardType.red,
              count: tapCounts[CardType.red]!,
              onTap: () => onTap(CardType.red),
            ),
            const SizedBox(height: 10),
            TapButton(
              type: CardType.blue,
              count: tapCounts[CardType.blue]!,
              onTap: () => onTap(CardType.blue),
            ),
          ],
        ),
      ),
    );
  }
}
