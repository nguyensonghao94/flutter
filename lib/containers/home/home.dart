import 'package:flutter/material.dart';
import 'package:todo/components/modalUpdateStatus/modalUpdateStatus.dart';
import 'package:todo/components/todo/todo.dart';
import 'package:todo/helpers/dialog.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/services/todo.dart';
import 'package:todo/services/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> listTodo = [];

  @override
  void initState() {
    super.initState();
    TodoService.getList().then((value) {
      setState(() {
        this.listTodo = value;
      });
    });
  }

  logout() async {
    await UserService().logout();
    Navigator.popAndPushNamed(context, '/login');
  }

  remove(id) async {
    try {
      await TodoService.remove(id.toString());
      final listTodo = await TodoService.getList();
      setState(() {
        this.listTodo = listTodo;
      });
    } catch (e) {
      alert(context, e.toString());
    }
  }

  edit(todo) {
    showDialog<void>(
      context: context,    
      builder: (BuildContext context) {
        return WModalUpdateStatusState(
          todo: todo,
          update: this.updateStatus
        );
      },
    );
  }

  updateStatus(id, status) async {
    Navigator.of(context).pop();
    final TodoModel todo = await TodoService.updateStatus(id, status);
    setState(() {
      this.listTodo.forEach((e) { 
        if (e.id == todo.id) {
          e.status = todo.status;
        }
      });      
      // Navigator.of(context, rootNavigator: true).pop('dialog');
    });
  }

  addTodo() {
    Navigator.pushNamed(context, '/add');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO APP"),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => this.logout(),
              child: Icon(Icons.logout),
            )
          ),
        ],
      ),
      body: RefreshIndicator(
        child: ListView(
          children: this.listTodo.map((todo) => WTodo(
            todo: todo,
            remove: (id) => this.remove(id),
            edit: (todo) => this.edit(todo)
          )).toList()
        ),
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 1),
            () async {
              final listTodo = await TodoService.getList();
              setState(() {
                this.listTodo = listTodo;
              });
            }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => this.addTodo(),
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}