import 'package:flutter/material.dart';
import 'package:widget_spinner/utils/StringUtils.dart';

class AnimatedContainerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            StringUtils.clearClassName(this.runtimeType.toString())
        ),
      ),
      body:  Center(
        child: Text("Not yet implemented"),
      ),
    );
  }

}