import 'package:flutter/material.dart';

class GestureRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureRouteState();
  }
}

class _GestureRouteState extends State<GestureRoute> {
  /// 保存事件名
  String _operation = 'No Gesture detected!';

  /// 更新显示的事件名
  void _updateText(String text) {
    setState(() {
      _operation = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Route'),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(_operation, style: TextStyle(color: Colors.white),),
          ),
          onTap: () => _updateText('Tap'),//点击
          onDoubleTap: () => _updateText('Double Tap'),//双击
          onLongPress: () => _updateText('Long Press'),//长按
        ),
      ),
    );
  }
}