import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:widget_spinner/model/todo_item.dart';
import 'package:widget_spinner/utils/logger.dart';

class DatabaseHelper {
  Logger logger = Logger('DatabaseHelper');

  static DatabaseHelper _databaseHelper;
  static Database _database;

  String todoTable = 'todo_table';

  String colId = 'id';
  String colName = 'name';
  String colDescription = 'description';
  String colPriority = 'priority';

  DatabaseHelper._createInstance();

  factory DatabaseHelper(){
    if (_databaseHelper == null)
      _databaseHelper = DatabaseHelper._createInstance();
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null)
      _database = await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'todo_items.db';
    var database = await openDatabase(path, version: 1, onCreate: _createDb);
    return database;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $todoTable('
        '$colId integer primary key autoincrement,'
        '$colName text,'
        '$colDescription text,'
        '$colPriority integer'
        ')');
  }

  Future<List<TodoItem>> getTodoItems() async {
    logger.debug('getTodoItems()');
    Database db = await this.database;
    var todoList = await db.query(todoTable);
    int count = todoList.length;

    List<TodoItem> todoItems = [];
    for (int i = 0; i < count; i++){
      todoItems.add(TodoItem.fromMap(todoList[i]));
    }
    return todoItems;
  }

  Future<int> addTodoItem(TodoItem todoItem) async {
    logger.debug("addTodoItem($todoItem)");
    Database db = await this.database;
    Map<String, dynamic> value = todoItem.toMap();
    var result = await db.rawInsert('INSERT INTO $todoTable ($colName, $colDescription, $colPriority)'
        ' values ("${todoItem.name}", "${todoItem.description}", ${todoItem.priority})');
    return result;
  }
  
  Future<int> removeTodoItem(int todoItemId) async {
    logger.debug("removeTodoItem($todoItemId)");
    Database db = await this.database;
    var result = await db.rawDelete('DELETE FROM $todoTable where $colId = $todoItemId');
    return result;
  }

}