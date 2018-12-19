import 'package:flutter/material.dart';

class SliverWidget extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // 确定每行的列个数的Grid，childAspectRatio为item的宽高比。行间距和列间距默认是0
      Widget fixedColumnCountGrid = SliverGrid.count(
        crossAxisCount: 3, childAspectRatio: 2.0, children: <Widget>[
          Container(color: Colors.red, height: 150,),
          Container(color: Colors.yellow, height: 150,),
          Container(color: Colors.green, height: 150,),
          Container(color: Colors.blue, height: 150,),
          Container(color: Colors.orange, height: 150,),
          Container(color: Colors.cyan, height: 150,),
          Container(color: Colors.indigo, height: 150,),
        ],);

      // 确定了最大的item宽度，自动通过设备宽度计算每行的列数。
      Widget maxExtentGrid = SliverGrid.extent(
        maxCrossAxisExtent: 110, children: <Widget>[
          Container(color: Colors.red, height: 150,),
          Container(color: Colors.yellow, height: 150,),
          Container(color: Colors.green, height: 150,),
          Container(color: Colors.blue, height: 150,),
          Container(color: Colors.orange, height: 150,),
          Container(color: Colors.cyan, height: 150,),
        ],);

      // 确定了item的mainAxisExpand，
      Widget fixExtentGrid = SliverFixedExtentList(
        itemExtent: 100.0, delegate: SliverChildListDelegate([
          Container(color: Colors.red,),
          Container(color: Colors.yellow,),
          Container(color: Colors.green,),
          Container(color: Colors.blue,),
          Container(color: Colors.orange,),
          Container(color: Colors.cyan,),
          Container(color: Colors.indigo,),
        ]),);
      
      return Scaffold(
        appBar: AppBar(
          title: Text('Sliver Demo'),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            fixedColumnCountGrid,
            maxExtentGrid,
            fixExtentGrid
          ],
        ),
      );
    }
}