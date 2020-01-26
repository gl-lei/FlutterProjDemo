import 'package:flutter/material.dart';

class RowColumnRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Column Route'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('hello world '),
              Text('I am Jack'),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('hello world '),
              Text('I am Jack'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text('hello world '),
              Text('I am Jack'),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text('hello world ', style: TextStyle(fontSize: 32.0),),
              Text('I am Jack'),
            ],
          ),
          Container(
            color: Colors.red,
            child: Column(
              mainAxisSize: MainAxisSize.max,//嵌套Column，设置无效，可以使用Expanded组件
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('hello world'),
                Text('I am Jack'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('hello world'),
                  Text('I am Jack'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}