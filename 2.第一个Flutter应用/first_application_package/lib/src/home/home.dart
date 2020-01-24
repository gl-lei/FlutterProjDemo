import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../2.2/route.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Route 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('Open Counter Route'),
              textColor: Colors.blue,
              onPressed: () => Navigator.of(context).pushNamed('2_counter_route'),
            ),
            FlatButton(
                child: Text('Open New Route',),
                textColor: Colors.green,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return NewRoute();
                  }));
                }
            ),
            RaisedButton(
              child: Text('路由传参示例'),
              onPressed: () async {
                String result = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return TipRoute(text: '路由传参路由传参',);
                  }),
                );

                // 打印路由返回值
                print('路由返回值：$result');
              },
            ),
            RaisedButton(
              child: Text('命名路由传参'),
              onPressed: () => Navigator.of(context).pushNamed('2_echo_route', arguments: 'hi echo!'),
            ),
            RaisedButton(
              child: Text('Package管理'),
              onPressed: () => Navigator.of(context).pushNamed('2_words_route'),
            ),
            RaisedButton(
              child: Text('资源管理'),
              onPressed: () => Navigator.of(context).pushNamed('2_resource_route'),
            ),
          ],
        ),
      ),
    );
  }
}