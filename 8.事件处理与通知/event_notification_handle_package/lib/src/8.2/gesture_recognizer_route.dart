import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureRecognizerRouteState();
  }
}

class _GestureRecognizerRouteState extends State<GestureRecognizerRoute> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;// 变色开关

  @override
  void dispose() {
    // 使用GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureRecognizer Route'),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '你好世界',
              ),
              TextSpan(
                text: '点我变色',
                style: TextStyle(
                  fontSize: 30.0,
                  color: _toggle ? Colors.blue : Colors.red,
                ),
                recognizer: _tapGestureRecognizer
                  ..onTap = () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  },
              ),
              TextSpan(text: '你好世界'),
            ]
          ),
        ),
      ),
    );
  }
}