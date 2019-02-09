import 'package:flutter/material.dart';
import 'package:widget_spinner/utils/StringUtils.dart';

class SafeAreaPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _SafeAreaPageState();

}

class _SafeAreaPageState extends State<SafeAreaPage>{

  bool safeAreaFlag = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: (safeAreaFlag) ? EdgeInsets.all(5.0) : EdgeInsets.all(0.0),
      top: safeAreaFlag,
      bottom: safeAreaFlag,
      left: safeAreaFlag,
      right: safeAreaFlag,
      child: Column(
        children: <Widget>[
          Material(
              color: Colors.blueAccent,
              child: Text(
                "Some content on my screen that I would not be able to read without a SafeArea Widget"
                " due to Notches or other phone elements that would block the view\n"
                "SafeArea is really just Padding with extra steps",
                style: TextStyle(
                  fontSize: 24.0,

                ),
              )
          ),
          SizedBox(
            height: 500,
          ),
          RaisedButton(
            child: Text((safeAreaFlag) ? "Deactivate SafeArea" : "Activate SafeArea"),
            onPressed: (){
              setState(() {
                safeAreaFlag = !safeAreaFlag;
              });
            },
          )
        ],
      ),
    );
  }

}