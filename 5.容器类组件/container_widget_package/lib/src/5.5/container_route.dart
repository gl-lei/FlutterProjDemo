import 'package:flutter/material.dart';

class ContainerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Route'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50.0, left: 120.0, bottom: 50.0),
            constraints: BoxConstraints.tight(Size(200.0, 150.0)),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.red, Colors.orange],
                  center: Alignment.center,
                  radius: .98,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                  )
                ]
            ),
            transform: Matrix4.rotationZ(.2),
            alignment: Alignment.center,//卡片内文字居中
            child: Text(
              'Hello World',
              style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),// 容器外补白
            color: Colors.orange,
            child: Text('Hello World'),
          ),
          Container(
            padding: EdgeInsets.all(20.0),// 容器内补白
            color: Colors.deepOrange,
            child: Text('Hello World'),
          ),
        ],
      )
    );
  }
}