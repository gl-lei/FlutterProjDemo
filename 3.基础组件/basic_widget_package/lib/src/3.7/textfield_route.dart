import 'package:flutter/material.dart';

class TextFieldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFieldRouteState();
  }
}

class _TextFieldRouteState extends State<TextFieldRoute> {
  // 输入焦点
  FocusNode uFocusNode = FocusNode();
  FocusNode pFocusNode = FocusNode();
  FocusScopeNode scopeNode;

  TextEditingController _unameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    uFocusNode.addListener(() {
      print('用户名输入框是否获取焦点：${uFocusNode.hasFocus}');
    });

    _unameController.addListener(() {
      print(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField Route'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 200.0
          ),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person),
                ),
                controller: _unameController,
                focusNode: uFocusNode,
                keyboardType: TextInputType.text,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                onChanged: (text) {
                  print('输入的密码：$text');
                },
                focusNode: pFocusNode,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('移动焦点'),
                    onPressed: () {
                      if (null == scopeNode) {
                        scopeNode = FocusScope.of(context);
                      }
                      scopeNode.requestFocus(pFocusNode);
                    },
                  ),
                  RaisedButton(
                    child: Text('隐藏键盘'),
                    onPressed: () {
                      uFocusNode.unfocus();
                      pFocusNode.unfocus();
                    },
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: '用户名',
                  prefixIcon: Icon(Icons.person),
                  // 未获得焦点下划线设为灰色
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  // 获取焦点下划线设置为蓝色
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      hintColor: Colors.teal[200],//定义下划线的颜色
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.red),//定义label字体样式
                        hintStyle: TextStyle(color: Colors.green, fontSize: 14.0),//定义提示文本样式
                      ),
                  ),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: '用户名',
                          hintText: '用户名或邮箱',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: '密码',
                          hintText: '您的登录密码',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: '电子邮件地址',
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none,
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellow[600])),
                  ),
                ),
                decoration: BoxDecoration(
                  // 可以使用这种方式来设置底部颜色，但是不建议
                  border:  Border(bottom: BorderSide(color: Colors.red[600], width: 1.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}