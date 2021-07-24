import 'package:flutter/material.dart';
import 'package:todo/constants/config.dart';
import 'package:todo/models/todo.dart';

class WModalUpdateStatus extends StatefulWidget {
  final TodoModel todo;
  final Function update;

  const WModalUpdateStatus({
    required this.todo,
    required this.update
  });

  @override
  _WModalUpdateStatusState createState() => _WModalUpdateStatusState();
}

class _WModalUpdateStatusState extends State<WModalUpdateStatus> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text("Detail ${this.todo.title}"),
      content: SingleChildScrollView(
        child: Container(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,                
                margin: const EdgeInsets.only(right: 15.0, bottom: 15),
                child: Image.network(widget.todo.getImage())
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text("Title: ${widget.todo.title}"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("Description: ${widget.todo.description}"),
              ),                            
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("Status:"),
              ),
              ListView(
                shrinkWrap: true,
                children: LIST_STATUS.map((status) => ListTile(
                  contentPadding: EdgeInsets.all(0),
                  horizontalTitleGap: 0.0,
                  minVerticalPadding: 2,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text(status["text"]),
                  leading: Radio(  
                    value: status["value"].toString(),
                    groupValue: widget.todo.status.toString(),
                    onChanged: (value) => widget.update(widget.todo.id, status["value"]),
                  )
                )).toList()
              )
            ],
          )
        )
      ),
      actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
    );
  }
}