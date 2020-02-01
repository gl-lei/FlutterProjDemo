import 'package:flutter/material.dart';

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}

class CustomNotificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomNotificationRouteState();
  }
}

class _CustomNotificationRouteState extends State<CustomNotificationRoute> {
  String _msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Notification Route'),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + ' ';
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              /*
              // 代码无效，因为context不对，通知监听器监听不到
              RaisedButton(
                onPressed: () => MyNotification('Hi').dispatch(context),
                child: Text('Send Notification'),
              ),*/
              Builder(
                builder: (context) {
                  return RaisedButton(
                    onPressed: () => MyNotification('Hi').dispatch(context),
                    child: Text('Send Notification'),
                  );
                },
              ),
              Text(_msg),
            ],
          ),
        ),
      ),
    );
  }
}