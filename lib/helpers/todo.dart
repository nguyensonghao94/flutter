import 'package:flutter/material.dart';

Color getColorByStatus (int status) {
  switch (status) {
    case 1:
      return Colors.blue;
    case 2:
      return Colors.green;
    default:
      return Colors.red;
  }
}

String getStatusName(int status) {
  switch (status) {
    case 1:
      return "In Progress";
    case 2:
      return "Completed";
    default:
      return "Cancel";
  }
}