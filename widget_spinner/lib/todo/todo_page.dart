import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:widget_spinner/model/todo_item.dart';
import 'package:widget_spinner/persistence/database_helper.dart';
import 'package:widget_spinner/todo/new_todo_page.dart';

class TodoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TodoPageState();

}

class _TodoPageState extends State<TodoPage>{

  DatabaseHelper databaseHelper = DatabaseHelper();

  List<TodoItem> todoItems;

  @override
  Widget build(BuildContext context) {
    if (todoItems == null){
      todoItems = [];
      updateTodoItems();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO List"),
      ),
      body: ListView.builder(
        itemCount: (todoItems != null) ? todoItems.length : 0,
        itemBuilder: (BuildContext ctx, int position){
          return ListTile(
            title: Text(todoItems[position].name),
            subtitle: Text(todoItems[position].description),
            leading: Container(
              color: Colors.red,
              child: Text("Priority")
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                deleteTodoItem(todoItems[position]);
              }
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewTodoPage())
          );
        }
      ),
    );
  }

  void updateTodoItems(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((_){
      Future<List<TodoItem>> todoItemsFuture = databaseHelper.getTodoItems();
      todoItemsFuture.then((items){
        setState(() {
          this.todoItems = items;
        });
      });
    });
  }

  void deleteTodoItem(TodoItem todoItem){

  }

}