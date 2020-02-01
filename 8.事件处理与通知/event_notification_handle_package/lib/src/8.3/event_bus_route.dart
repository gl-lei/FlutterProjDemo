import 'package:flutter/material.dart';

import 'event_bus.dart';

class EventBusRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventBusRouteState();
  }
}

class _EventBusRouteState extends State<EventBusRoute> {
  /// 用户名
  String _userName = '';

  /// 输入的密码
  String _password = '';

  @override
  void initState() {
    super.initState();

    bus.on('LoginSuccess', (info) {
      setState(() {
        _userName = info['UserName'] ?? '';
        _password = info['Password'] ?? '';
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    bus.off('LoginSuccess');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventBus Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 150.0,
              height: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('用户名：'),
                  Text(_userName),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: SizedBox(
                width: 150.0,
                height: 20.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('密码：'),
                    Text(_password),
                  ],
                ),
              )
            ),
            RaisedButton(
              child: Text('去登录'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return _LoginRoute();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}

/// 登录页
class _LoginRoute extends StatelessWidget {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录页'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          behavior: HitTestBehavior.opaque,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                controller: _userNameController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '登录密码',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                controller: _pwdController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  child: Text('登录'),
                  onPressed: () {
                    print('用户名：${_userNameController.text}');
                    print('密码：${_pwdController.text}');
                    bus.emit('LoginSuccess', {'UserName': _userNameController.text, 'Password': _pwdController.text});
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}