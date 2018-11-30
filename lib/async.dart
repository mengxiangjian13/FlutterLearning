import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AsyncDemo extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _AsyncDemoState();
    }
}

class _AsyncDemoState extends State<AsyncDemo> {

  List widgets = [];

  @override
    void initState() {
      super.initState();
      loadData();
    }

    Widget buildProgressIndicator() {
      return Center(child: CircularProgressIndicator(),);
    }

    Widget buildList() {
      return ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return Padding(padding: EdgeInsets.all(10.0), child: Text("${widgets[position]["title"]}"),);
        },
      );
    }

    Widget buildBody() {
      if (widgets.length == 0) {
        return buildProgressIndicator();
      } else {
        return buildList();
      }
    }
  
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Async Demo"),
      ),body: buildBody(),);
    }

    void loadData() async {
      String dataURL = "https://jsonplaceholder.typicode.com/posts";
      http.Response response = await http.get(dataURL);
      setState(() {
              widgets = json.decode(response.body);
            });
    }
}