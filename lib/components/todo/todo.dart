import 'package:flutter/material.dart';
import 'package:todo/components/status/status.dart';
import 'package:todo/helpers/text.dart';
import 'package:todo/models/todo.dart';

class WTodo extends StatelessWidget {
  final TodoModel todo;
  final Function remove;

  const WTodo({ 
    required this.todo,
    required this.remove
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(          
          bottom: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
        child: Row(          
          children: [
            Container(
              width: 100,
              margin: const EdgeInsets.only(right: 15.0),
              child: Image.network(this.todo.getImage())
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [                
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    capitalize(todo.title),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Text("Created at: ${this.todo.createdAt}"),
                Container(
                  margin: const EdgeInsets.only(top: 4.0),
                  child: Row(              
                    children: [
                      Text("Status"),
                      WStatus(status: this.todo.status)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2.0),
                  child: Row(                  
                    children: [
                      SizedBox(
                        width: 32,
                        height: 28,
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(4.0))
                          ),
                          onPressed: () => this.remove(this.todo.id),
                          child: Row(
                            children: [
                              const Icon(Icons.close, color: Colors.red, size: 22),
                            ]
                          )
                        ),
                      ),
                      SizedBox(
                        width: 32,
                        height: 28,
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(4.0))
                          ),
                          onPressed: () => this.remove(this.todo.id),
                          child: Row(
                            children: [
                              const Icon(Icons.edit, color: Colors.grey, size: 20),
                            ]
                          )
                        ),
                      )
                    ]
                  ),
                )
              ],      
            )
          ],
        )        
      ),
    );
  }
}