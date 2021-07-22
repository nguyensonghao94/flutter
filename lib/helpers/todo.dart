import 'package:flutter/material.dart';

Color getColorByStatus (int status) {
  if (status == 1) {
    return Colors.blue;
  }

  return Colors.blue;
}

String getStatusName(int status) {
  switch (status) {
    case 1:
      return "In Progress";
    default:
      return "In Progress";
  }
}