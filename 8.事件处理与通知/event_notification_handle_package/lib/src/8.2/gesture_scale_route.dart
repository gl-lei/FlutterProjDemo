import 'package:flutter/material.dart';

class GestureScaleRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureScaleRouteState();
  }
}

class _GestureScaleRouteState extends State<GestureScaleRoute> {
  /// 图片宽度
  double _width = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Scale Route'),
      ),
      body: Center(
        child: GestureDetector(
          child: Image.asset('images/scenery.jpg', width: _width, package: 'event_notification_handle_package',),
          onScaleUpdate: (ScaleUpdateDetails details) {
            // 缩放倍数在0.8倍到10倍之间
            setState(() {
              _width = 200 * details.scale.clamp(.8, 10.0);
            });
          },
        ),
      ),
    );
  }
}