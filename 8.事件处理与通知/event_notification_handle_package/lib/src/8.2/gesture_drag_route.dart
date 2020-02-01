import 'package:flutter/material.dart';

class GestureDragRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureDragRouteState();
  }
}

class _GestureDragRouteState extends State<GestureDragRoute> {
  /// 距离顶部的距离
  double _top = 0.0;

  /// 距离左边的距离
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Drag Route'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text('A'),
              ),
              // 手机按下时会触发此回调
              onPanDown: (DragDownDetails details) {
                print('用户手指按下：${details.globalPosition}');
              },
              // 手机滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails details) {
                // 用户手指滑动，更新偏移，重新构建
                setState(() {
                  _left += details.delta.dx;
                  _top += details.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails details) {
                // 打印滑动结束时在x、y轴上的速度
                print(details.velocity);
              },
            ),
          )
        ],
      )
    );
  }
}


/// 沿着一个方向拖动
class GestureDragSingleDirRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureDragSingleDirRouteState();
  }
}

class _GestureDragSingleDirRouteState extends State<GestureDragSingleDirRoute> {
  /// 距离顶部的距离
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gesture Drag Single Dir Route'),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              left: MediaQuery.of(context).size.width * 0.5 - 20 * 0.5,
              top: _top,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text('A'),
                ),
                // 垂直方向拖动事件
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _top += details.delta.dy;
                  });
                },
              ),
            )
          ],
        )
    );
  }
}