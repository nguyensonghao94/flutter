import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';


class WModalUpdateStatusState extends StatelessWidget {
  final TodoModel todo;
  final Function update;

  const WModalUpdateStatusState({
    required this.todo,
    required this.update
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Update todo status of ${this.todo.title}"),
      content: SingleChildScrollView(
        child: Container(
          child: DropdownButton<dynamic>(
            value: this.todo.status.toString(),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.blue),
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            onChanged: (value) => this.update(this.todo.id, value),
            items: <dynamic>[
              {
                "value": 1,
                "text": 'In Progress'
              }, 
              {
                "value": 2,
                "text": 'Completed'
              },
              {
                "value": 3,
                "text": 'Cancel'
              }]
              .map<DropdownMenuItem<String>>((dynamic status) {
              return DropdownMenuItem<String>(
                value: status['value'].toString(),
                child: Text(status['text']),
              );
            }).toList(),
          )
        )
      )
    );
  }
}