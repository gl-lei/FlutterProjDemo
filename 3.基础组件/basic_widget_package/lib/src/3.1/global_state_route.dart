import 'package:flutter/material.dart';

class GlobalStateRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GlobalStateRouteState();
  }
}

class _GlobalStateRouteState extends State<GlobalStateRoute> {
  static GlobalKey<ScaffoldState> _globalKey = GlobalKey(debugLabel: 'state_route_key');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'State Route'
        ),
      ),
      key: _globalKey,
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
            onPressed: () {
              // 通过globalKey来获取，开销较大，不建议使用
              ScaffoldState _state = _globalKey.currentState;
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