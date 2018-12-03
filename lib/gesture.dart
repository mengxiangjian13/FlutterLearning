import 'package:flutter/material.dart';

class GestureWidget extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(appBar: AppBar(title: Text("Gesture")), 
      body: Center(child: GestureDetector(child: Text("tap/double tap/long press here!", style: TextStyle(fontSize: 24.0),), 
      onTap: () {print('tap!');},
      onTapUp: (detail) {print('tap up!');},
      onTapDown: (detail){print('tap down!');},
      onDoubleTap: () {print('double tap!');},
      onLongPress: () {print('long press');},),),);
    }
}