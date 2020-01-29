import 'package:flutter/material.dart';
import 'package:scroll_widget_package/scroll_widget_package.dart' as scroll;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  WidgetBuilder _routeBuilder(BuildContext context, String routeName) {
    if (routeName.contains(RegExp(r'^6_'))) {
      switch (routeName) {
        case '6_home': return (context) => scroll.HomeRoute();
        case '6_single_child_scrollview_route': return (context) => scroll.SingleChildScrollViewRoute();
        case '6_listview_route': return (context) => scroll.ListViewRoute();
        case '6_listview_sliver_route': return (context) => scroll.ListViewSliverRoute();
        case '6_listview_separated_route': return (context) => scroll.ListViewSeparatedRoute();
        case '6_listview_infinite_route': return (context) => scroll.ListViewInfiniteRoute();
        case '6_gridview_fixed_route': return (context) => scroll.GridViewFixedRoute();
        case '6_gridview_quick_fixed_route': return (context) => scroll.GridViewQuickFixedRoute();
        case '6_gridview_max_extent_route': return (context) => scroll.GridViewMaxExtentRoute();
        case '6_gridview_max_extent_quick_route': return (context) => scroll.GridViewMaxExtentQuickRoute();
        case '6_gridview_builder_route': return (context) => scroll.GridViewBuilderRoute();
        case '6_custom_scrollview_route': return (context) => scroll.CustomScrollViewRoute();
        case '6_scrollcontroller_route': return (context) => scroll.ScrollControllerRoute();
        case '6_scrollcontroller_notification_route': return (context) => scroll.ScrollControllerNotificationRoute();
        default: return (context) => scroll.HomeRoute();
      }
    }
    return (context) => scroll.HomeRoute();
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
        var routeName = settings.name;
        return MaterialPageRoute(builder: _routeBuilder(context, routeName), settings: settings);
      },
      initialRoute: '6_home',
    );
  }
}
