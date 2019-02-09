import 'package:flutter/material.dart';
import 'package:widget_spinner/utils/StringUtils.dart';

class ExpandedPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ExpandedPageState();

}

class _ExpandedPageState extends State<ExpandedPage>{

  int expandDegreeFirst = 2;
  int expandDegreeSecond = 1;
  int expandDegreeThird = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(StringUtils.clearClassName(this.runtimeType.toString())),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blueAccent,
              child: Text("Without Expanded, I'm gonna take just as much space as I need"),
            ),
            Expanded(
              child: Container(
                color: Colors.greenAccent,
                child: Column(
                  children: <Widget>[
                    Text("With Expanded, I'll try to cover the remaining space\n"
                        "that is left for me on the screen"),
                    Expanded(
                      flex: expandDegreeFirst,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Column(
                            children: <Widget>[
                              Text("Expand degree:"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: (){
                                      setState(() {
                                        if (expandDegreeFirst  > 1)
                                          expandDegreeFirst--;
                                      });
                                    },
                                  ),
                                  Text(expandDegreeFirst.toString()),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: (){
                                      setState(() {
                                        expandDegreeFirst++;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          )
                        ),
                      )
                    ),
                    Expanded(
                      flex: expandDegreeSecond,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Column(
                            children: <Widget>[
                              Text("Expand degree:"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: (){
                                      setState(() {
                                        if (expandDegreeSecond > 1)
                                          expandDegreeSecond--;
                                      });
                                    },
                                  ),
                                  Text(expandDegreeSecond.toString()),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: (){
                                      setState(() {
                                        expandDegreeSecond++;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          )
                        ),
                      )
                    ),
                    Expanded(
                      flex: expandDegreeThird,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Column(
                            children: <Widget>[
                              Text("Expand degree:"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: (){
                                      setState(() {
                                        if (expandDegreeThird > 1)
                                          expandDegreeThird--;
                                      });
                                    },
                                  ),
                                  Text(expandDegreeThird.toString()),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: (){
                                      setState(() {
                                        expandDegreeThird++;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          )
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}