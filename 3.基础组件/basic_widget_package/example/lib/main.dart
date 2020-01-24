import 'package:flutter/material.dart';
import 'package:basic_widget_package/basic_widget_package.dart' as basic;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  WidgetBuilder _routeBuilder(BuildContext context, String routeName) {
    if (routeName.contains(RegExp(r'^3_'))) {
      switch (routeName) {
        case '3_home': return (context) => basic.HomeRoute();
        case '3_counter_route': return (context) => basic.CounterRoute();
        case '3_state_route': return (context) => basic.StateRoute();
        case '3_global_state_route': return (context) => basic.GlobalStateRoute();
        case '3_cupertino_state_route': return (context) => basic.CupertinoRoute();
        default: return (context) => basic.HomeRoute();
      }
    }
    return (context) => basic.HomeRoute();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      onGenerateRoute: (RouteSettings settings) {
        String routeName = settings.name;
        return MaterialPageRoute(builder: _routeBuilder(context, routeName), settings: settings);
      },
      initialRoute: '3_home',
    );
  }
}