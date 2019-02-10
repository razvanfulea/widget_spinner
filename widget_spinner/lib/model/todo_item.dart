import 'package:widget_spinner/model/priority.dart';

class TodoItem {
  int id;
  String name;
  String description;
  int priority;

  TodoItem(this.name, this.description, this.priority);

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['priority'] = priority;
    return map;
  }

  TodoItem.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.name = map['name'];
    this.description = map['description'];
    this.priority = map['priority'];
  }

}