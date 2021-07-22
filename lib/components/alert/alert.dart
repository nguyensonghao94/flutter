import 'package:flutter/material.dart';

class WAlert extends StatelessWidget {
  final String title;
  final String description;

  const WAlert({
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title),
      content: SingleChildScrollView(
        child: Text(this.description)
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}