import 'package:flutter/material.dart';
import 'package:widget_spinner/todo/todo_page.dart';
import 'package:widget_spinner/utils/StringUtils.dart';
import 'lib_all.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  TextEditingController ctrlSearch = TextEditingController();
  String keyword = "";

  List<Widget> widgets = [
    SafeAreaPage(),
    ExpandedPage(),
    WrapPage(),
    AnimatedContainerPage(),
    OpacityPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Spinner"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.assignment),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoPage())
              );
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ctrlSearch,
                decoration: InputDecoration(
                  labelText: "Search...",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: (){
                      setState(() {
                        ctrlSearch.clear();
                        keyword = "";
                      });
                      FocusScope.of(context).requestFocus(FocusNode());
                    }
                  )
                ),
                onChanged: (kw) {
                  setState(() {
                    debugPrint("Change: $kw");
                    this.keyword = kw;
                  });
                },
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView.builder(
                  itemCount: widgets.length,
                  itemBuilder: (BuildContext ctx, int position){
                    debugPrint("Text: $keyword; Length = ${keyword.length}");
                    return (keyword == null || keyword.length == 0 ||
                      this._search(widgets[position].toString(), keyword)) ?
                    ListTile(
                      leading: Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(color: Colors.black, width: 1.0)
                          ),
                          child: Center(
                              child: Text(position.toString())
                          )
                      ),
                      title: Text(StringUtils.clearClassName(widgets[position].toString())),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => widgets[position])
                        );
                      },
                    ) :
                    Container();
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _search(String className, String keyword){
    return StringUtils.clearClassName(className).toLowerCase().contains(keyword.toLowerCase());
  }

}