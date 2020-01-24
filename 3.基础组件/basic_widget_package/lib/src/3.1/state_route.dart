import 'package:flutter/material.dart';

class StateRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateRouteState();
  }
}

class _StateRouteState extends State<StateRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'State Route'
        ),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
            onPressed: () {
              // 1.直接获取
//              ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
              // 2.通过约定方法 of 来获取state
              ScaffoldState _state = Scaffold.of(context);
              _state.showSnackBar(SnackBar(
                content: Text('我是SnackBar'),
              ));
            },
            child: Text('显示SnackBar'),
          );
        },),
      ),
    );
  }
}