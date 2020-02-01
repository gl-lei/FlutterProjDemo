import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Route'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: double.infinity,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('PointerEvent Route'),
                onPressed: () => Navigator.of(context).pushNamed('8_pointer_event_route'),
              ),
              RaisedButton(
                child: Text('PointerEvent Opaque Route'),
                onPressed: () => Navigator.of(context).pushNamed('8_pointer_event_opaque_route'),
              ),
              RaisedButton(
                child: Text('PointerEvent Translucent Route'),
                onPressed: () => Navigator.of(context).pushNamed('8_pointer_event_translucent_route'),
              ),
              RaisedButton(
                child: Text('PointerEvent 忽略'),
                onPressed: () => Navigator.of(context).pushNamed('8_pointer_event_ignore_route'),
              ),
              RaisedButton(
                child: Text('手势检测'),
                onPressed: () => Navigator.of(context).pushNamed('8_gesture_route'),
              ),
              RaisedButton(
                child: Text('拖动'),
                onPressed: () => Navigator.of(context).pushNamed('8_gesture_drag_route'),
              ),
              RaisedButton(
                child: Text('一个方向拖动'),
                onPressed: () => Navigator.of(context).pushNamed('8_gesture_dray_single_dir_route'),
              ),
              RaisedButton(
                child: Text('缩放'),
                onPressed: () => Navigator.of(context).pushNamed('8_gesture_scale_route'),
              ),
              RaisedButton(
                child: Text('文字变色'),
                onPressed: () => Navigator.of(context).pushNamed('8_gesture_recognizer_route'),
              ),
              RaisedButton(
                child: Text('手势冲突'),
                onPressed: () => Navigator.of(context).pushNamed('8_gesture_conflict_route'),
              ),
              RaisedButton(
                child: Text('EventBus Route'),
                onPressed: () => Navigator.of(context).pushNamed('8_eventbus_route'),
              ),
              RaisedButton(
                child: Text('Notification Route'),
                onPressed: () => Navigator.of(context).pushNamed('8_notification_route'),
              ),
              RaisedButton(
                child: Text('自定义通知'),
                onPressed: () => Navigator.of(context).pushNamed('8_custom_notification_route'),
              ),
            ],
          ),
        ),
      )
    );
  }
}