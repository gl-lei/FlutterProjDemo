import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Widget 状态'),
              onPressed: () => Navigator.of(context).pushNamed('3_counter_route'),
            ),
            RaisedButton(
              child: Text('通过context获取state'),
              onPressed: () => Navigator.of(context).pushNamed('3_state_route'),
            ),
            RaisedButton(
              child: Text('通过Global Key获取state'),
              onPressed: () => Navigator.of(context).pushNamed('3_global_state_route'),
            ),
            RaisedButton(
              child: Text('Cupertino 风格'),
              onPressed: () => Navigator.of(context).pushNamed('3_cupertino_state_route'),
            )
          ],
        ),
      ),
    );
  }
}