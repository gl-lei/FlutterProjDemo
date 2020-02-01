import 'package:flutter/material.dart';
import 'package:event_notification_handle_package/event_notification_handle_package.dart' as event;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  WidgetBuilder _routeBuilder(BuildContext context, String routeName) {
    if (routeName.contains(RegExp(r'^8_'))) {
      switch (routeName) {
        case '8_home': return (context) => event.HomeRoute();
        case '8_pointer_event_route': return (context) => event.PointerEventRoute();
        case '8_pointer_event_opaque_route': return (context) => event.PointerEventOpaqueRoute();
        case '8_pointer_event_translucent_route': return (context) => event.PointerEventTranslucentRoute();
        case '8_pointer_event_ignore_route': return (context) => event.PointerEventIgnoreRoute();
        case '8_gesture_route': return (context) => event.GestureRoute();
        case '8_gesture_drag_route': return (context) => event.GestureDragRoute();
        case '8_gesture_dray_single_dir_route': return (context) => event.GestureDragSingleDirRoute();
        case '8_gesture_scale_route': return (context) => event.GestureScaleRoute();
        case '8_gesture_recognizer_route': return (context) => event.GestureRecognizerRoute();
        case '8_gesture_conflict_route': return (context) => event.GestureConflictRoute();
        case '8_eventbus_route': return (context) => event.EventBusRoute();
        case '8_notification_route': return (context) => event.NotificationRoute();
        case '8_custom_notification_route': return (context) => event.CustomNotificationRoute();
        default: return (context) => event.HomeRoute();
      }
    }
    return (context) => event.HomeRoute();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: _routeBuilder(context, settings.name), settings: settings);
      },
      initialRoute: '8_home',
    );
  }
}
