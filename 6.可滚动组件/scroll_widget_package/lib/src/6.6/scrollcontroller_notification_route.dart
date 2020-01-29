import 'package:flutter/material.dart';

class ScrollControllerNotificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerNotificationRouteState();
  }
}

class _ScrollControllerNotificationRouteState extends State<ScrollControllerNotificationRoute> {
  String _progress = '%0';// 进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollController Notification Route'),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
            // 重新构建
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print('BottomEdge: ${notification.metrics.extentAfter == 0}');
            return false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index) {
                  return ListTile(title: Text('$index'),);
                },
              ),
              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}