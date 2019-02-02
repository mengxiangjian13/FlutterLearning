import 'package:flutter/material.dart';
import 'demo.dart';
import 'isolates.dart';
import 'async.dart';
import 'gesture.dart';
import 'cupertino.dart';
import 'layout.dart';
import 'navigator.dart';
import 'navigateAnimation.dart';
import 'sliver.dart';
import 'jsonSerialization.dart';
import 'tanslation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomeList(),
    );
  }
}

class HomeList extends StatelessWidget {
  final _contents = ["first demo (RandomWords)", "Threading & asynchronicity", 
  "Isolates", "Gesture", "Cupertino Style", "Layout", "Navigator", "Navigate Animation",
  "Sliver", "Json Serialization", "Google Translation"];
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Learning"
        ),
      ),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: _contents.length * 2,
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        final index = i ~/ 2;
        if (index < _contents.length) {
          final name = _contents[index];
          final s = index + 1;
          return ListTile(title: Text(
            "$s. $name",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ), onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  if (index == 1) {
                    return AsyncDemo();
                  } else if (index == 2) {
                    return IsolatesWidget();
                  } else if (index == 3) {
                    return GestureWidget();
                  } else if (index == 4) {
                    return CupertinoWidget();
                  } else if (index == 5) {
                    return LayoutWidget();
                  } else if (index == 6) {
                    return NavRootScreen();
                  } else if (index == 7) {
                    return NavAnimationWidget();
                  } else if (index == 8) {
                    return SliverWidget();
                  } else if (index == 9) {
                    return JsonSerializationWidget();
                  } else if (index == 10) {
                    return GoogleTranslate();
                  }
                  return RandomWords();
                }
                )
            );
          });
        }
      },
    );
  }
}
