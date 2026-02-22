import 'package:flutter/material.dart';
import 'homScreen.dart';

class TapButton extends StatelessWidget {
  final CardType type;
  final VoidCallback onTap;
  final int count;

  const TapButton({
    super.key,
    required this.type,
    required this.count,
    required this.onTap,
  });

  Color get tabColor => type == CardType.blue ? Colors.blue : Colors.red;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: tabColor,
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            "Tap $count",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
