import 'package:flutter/material.dart';

class NavRootScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ReturnDataDemo'),
        ),
        body: Center(
          child: _SelectionButton(),
        ),
      );
    }
}

class _SelectionButton extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return RaisedButton(
            child: Text('push to next page'),
            onPressed: () {
              _navigateToNextPage(context);
            },
          );
    }

     _navigateToNextPage(BuildContext context) async {
      final result = await Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => _SelectionScreen()));
      Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
    }
}

class _SelectionScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Select an option'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  child: Text('Yep!'),
                  onPressed: () {
                    Navigator.pop(context, 'Yep!');
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  child: Text('Nope!'),
                  onPressed: () {
                    Navigator.pop(context, 'Nope!');
                  },
                ),
              )
            ],
          ),
        ),
      );
    }
}