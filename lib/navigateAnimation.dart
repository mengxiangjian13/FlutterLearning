import 'package:flutter/material.dart';

class NavAnimationWidget extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Naivgate Animation'),
        ),
        body: Hero(
          tag: 'imageTag',
          child: GestureDetector(
            child: Image.network(
              'https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg',
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => _ImageShowWidget()
              ));
            },
          ),
        ),
      );
    }
}

class _ImageShowWidget extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Hero(
              tag: 'imageTag',
              child: Image.network(
                'https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg',
              ),
            ),
          ),
        ),
      );
    }
}