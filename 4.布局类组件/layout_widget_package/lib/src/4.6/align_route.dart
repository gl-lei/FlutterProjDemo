import 'package:flutter/material.dart';

class AlignRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 120.0,
                  height: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FlutterLogo(
                      size: 60.0,
                    ),
                  ),
                ),
                Container(
                  color: Colors.purple[50],
                  child: Align(
                    // 不显示指定Container的宽度和高度，指定widthFactor和heightFactor也可以
                    // 会自动计算父容器的大小
                    widthFactor: 2.0,
                    heightFactor: 2.0,
                    alignment: Alignment.topRight,
                    child: FlutterLogo(
                      size: 60.0,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 120.0,
                  height: 120.0,
                  color: Colors.green[400],
                  child: Align(
                    alignment: Alignment(0.0, 1.0),
                    child: FlutterLogo(
                      size: 60.0,
                    ),
                  ),
                ),
                Container(
                  color: Colors.red[300],
                  child: Align(
                    // 不显示指定Container的宽度和高度，指定widthFactor和heightFactor也可以
                    // 会自动计算父容器的大小
                    widthFactor: 2.0,
                    heightFactor: 2.0,
                    alignment: Alignment(-1, -1),
                    child: FlutterLogo(
                      size: 60.0,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 120.0,
                  height: 120.0,
                  color: Colors.blue[300],
                  child: Align(
                    // FractionalOffset的坐标原点为矩形左侧顶点
                    alignment: FractionalOffset(1, 1),
                    child: FlutterLogo(
                      size: 100.0,
                    ),
                  ),
                ),
                Container(
                  color: Colors.pink[500],
                  child: Align(
                    // 不显示指定Container的宽度和高度，指定widthFactor和heightFactor也可以
                    // 会自动计算父容器的大小
                    widthFactor: 2.0,
                    heightFactor: 2.0,
                    alignment: FractionalOffset(1, 1),
                    child: FlutterLogo(
                      size: 60.0,
                    ),
                  ),
                )
              ],
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: Text('xxxxx'),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Center(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text('xxxxx'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}