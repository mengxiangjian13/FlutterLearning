import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Models/repo.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class JsonSerializationWidget extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _JsonSerializationState();
    }
}

class _JsonSerializationState extends State<JsonSerializationWidget> {

  List<Repo> repos = [];

  @override
    void initState() {
      super.initState();
      loadRepos();
    }

  void loadRepos() async {
    String url = 'https://api.github.com/search/repositories?q=rxswift&page=1';
    http.Response response = await http.get(url);
    Map<String, dynamic> dict = json.decode(response.body);
    List<dynamic> data = dict['items'];
    if (this.mounted) {
      // check this.mounted before setState
      setState(() {
          repos.removeRange(0, repos.length);
          for (var i = 0; i < data.length; i++) {
            repos.add(Repo.fromJson(data[i]));
          }
        });
    }
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('RxSwift Repos'),
        ),
        body: buildBody(),
      );
    }

    Widget buildBody() {
      if (repos.length > 0) {
        return ListView.builder(
          itemCount: repos.length * 2,
          itemBuilder: (BuildContext context, int i) {
            if (i.isOdd) {
              return Divider();
            }
            int row = i ~/ 2;
            Repo repo = repos[row];
            String fullName = repo.fullName;
            return ListTile(
              title: Text(fullName),
              onTap: () {
                String url = 'https://github.com/$fullName';
                launcher.launch(url);                
              },
            );
          },
        );
      }
      return Center(child: CircularProgressIndicator(),);
    }
}