import 'package:flutter/material.dart';
import 'package:layout_widget_package/layout_widget_package.dart' as layout;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  WidgetBuilder _routeBuilder(BuildContext context, String routeName) {
    if (routeName.contains(RegExp(r'^4_'))) {
      switch (routeName) {
        case '4_home': return (context) => layout.HomeRoute();
        case '4_row_column_route': return (context) => layout.RowColumnRoute();
        case '4_flex_route': return (context) => layout.FlexRoute();
        case '4_wrap_flow_route': return (context) => layout.WrapFlowRoute();
        case '4_stack_position_route': return (context) => layout.StackPositionRoute();
        case '4_align_route': return (context) => layout.AlignRoute();
        default: return (context) => layout.HomeRoute();
      }
    }
    return (context) => layout.HomeRoute();
  }

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
        String routeName = settings.name;
        return MaterialPageRoute(builder: _routeBuilder(context, routeName), settings: settings);
      },
      initialRoute: '4_home',
    );
  }
}