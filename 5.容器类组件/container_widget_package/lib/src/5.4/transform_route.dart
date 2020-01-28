import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight,// 相对于坐标原点的对齐方式
                transform: Matrix4.skewY(0.3),// 沿Y轴倾斜0.3弧度
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Transform.translate(
                // 默认原点为左上角，左移20像素，向上平移5像素
                offset: Offset(-20.0, -5.0),
                child: Text('Hello World'),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Transform.rotate(
                angle: math.pi * 0.5,
                child: Text('Hello World'),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Transform.scale(
                scale: 1.5,
                child: Text('Hello World'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.red
                  ),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Text('Hello World'),
                  ),
                ),
                Text('你好', style: TextStyle(color: Colors.green, fontSize: 18.0),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),
                  child: RotatedBox(
                    quarterTurns: 1,// 旋转90度(1/4圈)
                    child: Text('Hello World'),
                  ),
                ),
                Text('你好', style: TextStyle(color: Colors.green, fontSize: 18.0),),
              ],
            )
          ],
        ),
      ),
    );
  }
}