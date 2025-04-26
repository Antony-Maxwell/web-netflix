import 'package:flutter/material.dart';

class MyListButton extends StatelessWidget {
  const MyListButton({
    super.key,
    required this.icon,
    required this.title
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        Text(
         title,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ],
    );
  }
}