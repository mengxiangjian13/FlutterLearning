import 'package:flutter/material.dart';
import 'demo.dart';
import 'async.dart';

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
  final _contents = ["first demo (RandomWords)", "Threading & asynchronicity"];
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
