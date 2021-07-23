import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

void toast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}