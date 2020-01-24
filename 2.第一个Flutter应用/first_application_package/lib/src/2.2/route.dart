import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Route'),
      ),
      body: Center(
        child: Text(
          'This is new Route'
        ),
      ),
    );
  }
}

/// 路由传参示例
class TipRoute extends StatelessWidget {
  TipRoute({Key key, @required this.text}): super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Route'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(text),
              RaisedButton(
                child: Text('返回'),
                onPressed: () => Navigator.of(context).pop('我是返回值'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// 命令路由传参示例
class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取路由参数
    String _args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Echo Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_args ?? 'null'),
          ],
        ),
      ),
    );
  }
}