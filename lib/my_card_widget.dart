import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  IconData icon;
  String text;
  MyCardWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
      ],
    );
  }
}