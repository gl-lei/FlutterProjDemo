import 'package:flutter/material.dart';
import 'package:container_widget_package/container_widget_package.dart' as container;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  WidgetBuilder _routeBuilder(BuildContext context, String routeName) {
    if (routeName.contains(RegExp(r'^5_'))) {
      switch (routeName) {
        case '5_home': return (context) => container.HomeRoute();
        case '5_padding_route': return (context) => container.PaddingRoute();
        case '5_constraint_route': return (context) => container.ConstraintRoute();
        case '5_decorated_box_route': return (context) => container.DecoratedBoxRoute();
        case '5_transform_route': return (context) => container.TransformRoute();
        case '5_container_route': return (context) => container.ContainerRoute();
        case '5_scaffold_route': return (context) => container.ScaffoldRoute();
        case '5_clip_route': return (context) => container.ClipRoute();
        default: return (context) => container.HomeRoute();
      }
    }
    return (context) => container.HomeRoute();
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
        String routeName = settings.name;
        return MaterialPageRoute(builder:_routeBuilder(context, routeName), settings: settings);
      },
      initialRoute: '5_home',
    );
  }
}