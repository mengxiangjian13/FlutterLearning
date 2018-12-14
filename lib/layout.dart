import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(appBar: AppBar(title: Text('Layout demo'),),
      body: buildBody(),);
    }

    Widget buildBody() {
      Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground', 
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.red[500]
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
      );

      Column buildButtonColumn(IconData icon, String label) {
        Color color = Colors.blue;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: color,),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: color
                ),
              ),
            )
          ],
        );
      }

      Widget buttonSection = Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButtonColumn(Icons.call, 'CALL'),
            buildButtonColumn(Icons.near_me, 'ROUTE'),
            buildButtonColumn(Icons.share, 'SHARE')
          ],
        ),
      );

      Widget textSection = Container(
        padding: EdgeInsets.all(32.0),
        child: Text(
          '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
        ),
      );

      Widget imageSection = Image.asset(
        'images/lake.jpg',
        height: 240.0,
        fit: BoxFit.cover,
      );
      return ListView(
        children: <Widget>[
          imageSection,
          titleSection,
          buttonSection,
          textSection
        ],
      );
    }


}