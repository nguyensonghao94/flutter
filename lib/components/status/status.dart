import 'package:flutter/material.dart';
import 'package:todo/helpers/todo.dart';

class WStatus extends StatelessWidget {
  final int status;

  const WStatus({ 
    required this.status
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: getColorByStatus(this.status),        
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6.0, 6, 6.0, 4),
        child: Text(
          getStatusName(this.status),
          style: TextStyle(
            color: Colors.white,
            fontSize: 13
          ),
        ),
      ),
    );
  }
}