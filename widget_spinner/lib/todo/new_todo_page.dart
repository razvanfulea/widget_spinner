import 'package:flutter/material.dart';
import 'package:widget_spinner/model/priority.dart';
import 'package:widget_spinner/model/todo_item.dart';
import 'package:widget_spinner/persistence/database_helper.dart';
import 'package:widget_spinner/utils/toaster.dart';

class NewTodoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _NewTodoPageState();

}

class _NewTodoPageState extends State<NewTodoPage> {

  DatabaseHelper databaseHelper = DatabaseHelper();

  final TextEditingController ctrlName = TextEditingController();
  final TextEditingController ctrlDescription = TextEditingController();
  int selectedPriority = Priority.MEDIUM;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add TODO"),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: ctrlName,
                        validator: (value){
                          if (value.isEmpty){
                            return 'Please enter the name';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: ctrlDescription,
                        decoration: InputDecoration(
                          labelText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                          )
                        ),
                      ),
                    ),
                    Row(
//                  mainAxisSize: MainAxisSize.max,
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 3.0
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (selectedPriority == Priority.LOW) ?
                                      Colors.green : Colors.white,
                                ),
                                child: Center(
                                  child: Text("Low")
                                ),
                              ),
                              onTap: (){
                                print("Tapped LOW");
                                setState(() {
                                  this.selectedPriority = Priority.LOW;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Colors.amber,
                                    width: 3.0
                                  ),
                                  color: (selectedPriority == Priority.MEDIUM) ?
                                      Colors.amber : Colors.white,
                                ),
                                child: Center(
                                  child: Text("Medium")
                                ),
                              ),
                              onTap: (){
                                print("Tapped MEDIUM");
                                setState(() {
                                  this.selectedPriority = Priority.MEDIUM;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 3.0
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (selectedPriority == Priority.HIGH) ?
                                    Colors.red : Colors.white,
                                ),
                                child: Center(
                                  child: Text("High")
                                ),
                              ),
                              onTap: (){
                                print("Tapped HIGH");
                                setState(() {
                                  this.selectedPriority = Priority.HIGH;
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("ADD"),
                    onPressed: _onSubmit
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }

  void _onSubmit() async {
    if (_formKey.currentState.validate()){
      TodoItem todoItem = TodoItem(ctrlName.text, ctrlDescription.text, selectedPriority);
      int result = await databaseHelper.addTodoItem(todoItem);
      if (result != 0){
        // ok
        Toaster.showToast("Successfully added");
      } else {
        // error
        Toaster.showToast("Could not add TODO");
      }
    }
  }

}