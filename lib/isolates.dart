import 'package:flutter/material.dart';

class IsolatesWidget extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(appBar: AppBar(title: Text("Isolates"),),
       body: Center(child: Text("Read the Flutter document!", style: TextStyle(fontSize: 30.0),),),);
    }
}