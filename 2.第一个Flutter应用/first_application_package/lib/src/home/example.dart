import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../2.2/router.dart';

class ExampleRoute extends StatelessWidget {
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
              child: Text('Open Counter Router'),
              textColor: Colors.blue,
              onPressed: () => Navigator.of(context).pushNamed('2_counter_router'),
            ),
            FlatButton(
                child: Text('Open New Router',),
                textColor: Colors.green,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return NewRouter();
                  }));
                }
            ),
            RaisedButton(
              child: Text('路由传参示例'),
              onPressed: () async {
                String result = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return TipRouter(text: '路由传参路由传参',);
                  }),
                );

                // 打印路由返回值
                print('路由返回值：$result');
              },
            ),
            RaisedButton(
              child: Text('命名路由传参'),
              onPressed: () => Navigator.of(context).pushNamed('2_echo_router', arguments: 'hi echo!'),
            ),
            RaisedButton(
              child: Text('Package管理'),
              onPressed: () => Navigator.of(context).pushNamed('2_words_router'),
            ),
            RaisedButton(
              child: Text('资源管理'),
              onPressed: () => Navigator.of(context).pushNamed('2_resource_router'),
            ),
          ],
        ),
      ),
    );
  }
}