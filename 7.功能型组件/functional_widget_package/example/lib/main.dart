import 'package:flutter/material.dart';
import 'package:functional_widget_package/functional_widget_package.dart' as functional;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  WidgetBuilder _routeBuilder(BuildContext context, String routeName) {
    if (routeName.contains(RegExp(r'^7_'))) {
      switch (routeName) {
        case '7_home': return (context) => functional.HomeRoute();
        case '7_popscope_route': return (context) => functional.PopScopeRoute();
        case '7_inherited_route': return (context) => functional.InheritedRoute();
        case '7_provider_route': return (context) => functional.ProviderRoute();
        case '7_color_route': return (context) => functional.ColorRoute();
        case '7_theme_route': return (context) => functional.ThemeRoute();
        case '7_futurebuilder_route': return (context) => functional.FutureBuilderRoute();
        case '7_streambuilder_route': return (context) => functional.StreamBuilderRoute();
        case '7_dialog_route': return (context) => functional.DialogRoute();
        default: return (context) => functional.HomeRoute();
      }
    }
    return (context) => functional.HomeRoute();
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
      initialRoute: '7_home',
    );
  }
}