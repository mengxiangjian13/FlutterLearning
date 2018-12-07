import 'package:flutter/cupertino.dart';
import 'dart:async';

class CupertinoWidget extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return _CupertinoState();
  }
}

class _CupertinoState extends State<CupertinoWidget> {
  bool refresh = false;
  double _sliderValue = 0.3;
  @override
    void initState() {
      super.initState();
      Timer(Duration(seconds: 3), timeout);
    }

    void timeout() {
      setState(() {
              refresh = true;
            });
    }
@override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(navigationBar: CupertinoNavigationBar(middle: Text('Cupertino'),), 
    child: buildPage(context),);
  }

  Widget buildPage(BuildContext context) {
    if (refresh) {
      return ListView.builder(itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return buildRow(index);
      },);
    } else {
      return Center(child: CupertinoActivityIndicator(),);
    }
  }

  Widget buildRow(int index) {
    if (index == 0) {
      return Padding(padding: EdgeInsets.all(10.0), 
        child: Center(child: CupertinoButton(child: Center(child: Text('Click!'),), color: Color.fromARGB(255, 255, 0, 0),onPressed: (){
          print('Click!');
        },),));
    } else if (index == 1) {
      return Padding(padding: EdgeInsets.all(10.0), child: CupertinoSlider(value: _sliderValue, onChanged: (value) {
        setState(() {
                  _sliderValue = value;
                });
      },),);
    } else if (index == 2) {
      final Map<int, Widget> children = const {0:Text('Text1', style: TextStyle(fontSize: 15),), 1:Text('Text2', style: TextStyle(fontSize: 15))};
      return Padding(padding: EdgeInsets.all(10.0), 
      child: Center(child: CupertinoSegmentedControl(children: children, onValueChanged: (value) {
        print('select $value');
      },),),);
    } else if (index == 3) {
      return Padding(padding: EdgeInsets.all(10.0), 
        child: Center(child: CupertinoButton(child: Center(child: Text('Alert!'),), color: Color.fromARGB(255, 255, 0, 0),onPressed: (){
          print('Alert!');
        },),));
    } else {
      CupertinoTextField field = CupertinoTextField(placeholder: '默认文字', onChanged: (text) {
        print("text：$text");
      }, onEditingComplete: () {
        print("edit complete!");
      }, onSubmitted: (text) {
        print('submit text: $text');
      },);
      return Padding(padding: EdgeInsets.all(10.0), 
      child: field);
    }
  }
}