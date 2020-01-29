import 'package:flutter/material.dart';

class SingleChildScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return Scaffold(
      appBar: AppBar(
        title: Text('SingChildScrollView Route'),
      ),
      body: Scrollbar(
        // 显示滚动条
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: str.split('').map((e) => Text(e, textScaleFactor: 2.0,)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}