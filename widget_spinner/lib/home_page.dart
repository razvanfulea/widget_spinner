import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  List<Widget> widgets = List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Spinner"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("First"),
            onTap: (){
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("Open First"))
              );
            },
          ),
          Container(
            decoration: BoxDecoration(color: Colors.deepOrange),
            child: ListTile(
              title: Text("Second"),

              onTap: (){
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("Open Second"))
                );
              },
            ),
          ),
          ListTile(
            title: Text("Third"),
            onTap: (){
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Open Third"))
              );
            },
          ),
        ],
      )
    );
  }

}