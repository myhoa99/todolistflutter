import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolistappflutter/models/todo.dart';
import 'package:todolistappflutter/services/todo_service.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoService _todoService;
  List<Todo> _todoList = List<Todo>();
  @override
  initState() {
    super.initState();
    getAllTodos();
  }
  getAllTodos() async {
    _todoService = TodoService();
    _todoList = <Todo>[];

    var todos = await _todoService.readTodos();

    todos.forEach((todo) {
      setState(() {
        var model = Todo();
        model.id = todo['id'];
        model.title = todo['title'];
        model.description = todo['description'];
        model.category = todo['category'];
        model.todoDate = todo['todoDate'];
        model.isFinished = todo['isFinished'];
        _todoList.add(model);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top:8.0, left: 8.0, right: 8.0),
              child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(_todoList[index].title ?? 'No Title')
                      ],
                    ),
                    subtitle: Text(_todoList[index].category ?? 'No Category'),
                    trailing: Text(_todoList[index].todoDate ?? 'No Date'),
                  )),
            );
          }),
    );
  }
}
