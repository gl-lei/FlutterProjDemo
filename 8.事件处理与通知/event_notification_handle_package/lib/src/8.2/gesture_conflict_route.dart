import 'package:flutter/material.dart';

class GestureConflictRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureConflictRouteState();
  }
}

/// 如果我们的代码逻辑中，对于手指按下和抬起是强依赖，这时候我们需要通过Listener监听原始指针事件就可以
/// 手机冲突只是手机级别的，而手势是对原始指针的语义化的识别，在遇到复杂场景时，都可以通过
/// Listener直接识别原始指针事件来解决冲突
class _GestureConflictRouteState extends State<GestureConflictRoute> {
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Conflict Route'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: _left,
            child: Listener(
              onPointerDown: (details) {
                print('down');
              },
              onPointerUp: (details) {
                print('up');
              },
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text('A'),
                ),
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _left += details.delta.dx;
                  });
                },
                onHorizontalDragEnd: (details) {
                  print('onHorizontalDragEnd');
                },
                /*
              onTapDown: (details) {
                print('down');
              },
              onTapUp: (details) {
                print('up');
              },*/
              ),
            )
          )
        ],
      ),
    );
  }
}