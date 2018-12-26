import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Models/repo.dart';

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
    setState(() {
          for (var i = 0; i < data.length; i++) {
            repos.add(Repo.fromJson(data[i]));
          }
        });
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Repos'),
        ),
        body: buildBody(),
      );
    }

    Widget buildBody() {
      if (repos.length > 0) {
        return ListView.builder(
          itemCount: repos.length,
          itemBuilder: (BuildContext context, int row) {
            Repo repo = repos[row];
            String name = repo.name;
            String fullName = repo.fullName;
            int id = repo.id;
            return ListTile(
              title: Text(name),
              onTap: () {
                print('repo id is $id, web page is https://github.com/$fullName');
              },
            );
          },
        );
      }
      return Center(child: CircularProgressIndicator(),);
    }
}