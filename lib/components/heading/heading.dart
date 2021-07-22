import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;

  const Heading({ required this.title });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.grey
      ),
    );
  }
}