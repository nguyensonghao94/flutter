import 'package:flutter/material.dart';
import 'package:todo/components/alert/alert.dart';

Future<void> alert(context, String str) async {
  return showDialog<void>(
    context: context,    
    builder: (BuildContext context) {
      return WAlert(
        title: "Alert", 
        description: str
      );
    },
  );
}