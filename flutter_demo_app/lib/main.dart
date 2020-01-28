import 'package:flutter/material.dart';
import 'package:first_application_package/first_application_package.dart' as first;
import 'package:basic_widget_package/basic_widget_package.dart' as basic;
import 'package:layout_widget_package/layout_widget_package.dart' as layout;
import 'package:container_widget_package/container_widget_package.dart' as container;

void main() => runApp(MyApp());

/// MyApp作为根widget，指定应用的风格
/// MaterialApp 是 Material 库中提供的Flutter APP框架。通过它可以设置应用的名称、主题、语言、首页及路由列表等。
/// home 属性也是一个widget
class MyApp extends StatelessWidget {
  /// 命名路由统一拦截处理
  WidgetBuilder _routerBuilder(BuildContext context, String routeName) {
    if (routeName == 'home') {
      return (context) => MainHomeRoute();
    }

    if (routeName.contains(RegExp(r'^2_'))) {
      switch (routeName) {
        case '2_home': return (context) => first.HomeRoute();
        case '2_counter_route': return (context) => first.CounterWidget(title: 'Counter Route',);
        case '2_new_route': return (context) => first.NewRoute();
        case '2_tip_route': return (context) => first.TipRoute(text: ModalRoute.of(context).settings.arguments,);
        case '2_echo_route': return (context) => first.EchoRoute();
        case '2_words_route': return (context) => first.WordsRoute();
        case '2_resource_route': return (context) => first.ResourceRoute();
        default: return (context) => first.HomeRoute();
      }
    } else if (routeName.contains(RegExp(r'^3_'))) {
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
    } else if (routeName.contains(RegExp(r'^4_'))) {
      switch (routeName) {
        case '4_home': return (context) => layout.HomeRoute();
        case '4_row_column_route': return (context) => layout.RowColumnRoute();
        case '4_flex_route': return (context) => layout.FlexRoute();
        case '4_wrap_flow_route': return (context) => layout.WrapFlowRoute();
        case '4_stack_position_route': return (context) => layout.StackPositionRoute();
        case '4_align_route': return (context) => layout.AlignRoute();
        default: return (context) => layout.HomeRoute();
      }
    } else if (routeName.contains(RegExp(r'^5_'))) {
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
    return (context) => MainHomeRoute();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        // 判断命名路由的跳转
        String routerName = settings.name;
        return MaterialPageRoute(builder: _routerBuilder(context, routerName), settings: settings);
      },
      /*
      // 路由表
      routes: {
        "new_router": (context) => first.NewRouter(),
        "tip_router": (context) => first.TipRouter(text: ModalRoute.of(context).settings.arguments,),
        "echo_router": (context) => first.EchoRouter(),
        "/": (context) => first.CounterWidget(title: 'Counter Demo',),
      },*/
      initialRoute: "home",
    );
  }
}


/// Package入口
class MainHomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Home Route'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('First Application Package'),
                onPressed: () => Navigator.of(context).pushNamed('2_home'),
              ),
              RaisedButton(
                child: Text('Basic Widget Package'),
                onPressed: () => Navigator.of(context).pushNamed('3_home'),
              ),
              RaisedButton(
                child: Text('Layout Widget Package'),
                onPressed: () => Navigator.of(context).pushNamed('4_home'),
              ),
              RaisedButton(
                child: Text('Container Widget Pacakge'),
                onPressed: () => Navigator.of(context).pushNamed('5_home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}