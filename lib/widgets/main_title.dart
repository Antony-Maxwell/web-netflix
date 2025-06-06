import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),
    );
  }
}
