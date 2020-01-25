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
        case '3_tapboxa_route': return (context) => basic.TapBoxARoute();
        case '3_tapboxb_route': return (context) => basic.TapBoxBParentWidget();
        case '3_tapboxc_route': return (context) => basic.TapBoxCParentWidget();
        case '3_text_route': return (context) => basic.TextRoute();
        case '3_button_route': return (context) => basic.ButtonRoute();
        case '3_image_icon_route': return (context) => basic.ImageIconRoute();
        case '3_switch_checkbox_route': return (context) => basic.SwitchCheckboxRoute();
        case '3_textfield_route': return (context) => basic.TextFieldRoute();
        case '3_form_route': return (context) => basic.FormRoute();
        case '3_progress_route': return (context) => basic.ProgressRoute();
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