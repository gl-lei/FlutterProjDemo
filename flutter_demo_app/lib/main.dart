import 'package:flutter/material.dart';
import 'package:first_application_package/first_application_package.dart' as first;

void main() => runApp(MyApp());

/// MyApp作为根widget，指定应用的风格
/// MaterialApp 是 Material 库中提供的Flutter APP框架。通过它可以设置应用的名称、主题、语言、首页及路由列表等。
/// home 属性也是一个widget
class MyApp extends StatelessWidget {
  /// 命名路由统一拦截处理
  WidgetBuilder _routerBuilder(BuildContext context, String routerName) {
    switch (routerName) {
      case 'new_router': return (context) => first.NewRouter();
      case 'tip_router': return (context) => first.TipRouter(text: ModalRoute.of(context).settings.arguments,);
      case 'echo_router': return (context) => first.EchoRouter();
      case '/': return (context) => first.CounterWidget(title: 'Couter Demo',);
      default: return (context) => first.CounterWidget(title: 'Default Route',);
    }
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
      initialRoute: "/",
    );
  }
}