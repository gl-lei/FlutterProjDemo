import '../2.2/router.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  CounterWidget({Key key, this.title}): super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times.'
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text(
                'Open New Router',
              ),
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
              onPressed: () {
                Navigator.of(context).pushNamed('echo_router', arguments: 'hi echo!');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}