import 'package:flutter/material.dart';

class TextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文本样式'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Hello world', textAlign: TextAlign.left,),
          Text("Hello world, I'm Jack" * 4, maxLines: 1, overflow: TextOverflow.ellipsis,),
          Text("Hello world", textScaleFactor: 1.5,),
          Text('Hello world' * 6, textAlign: TextAlign.center,),
          Text('Hello world',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: 'Courier',
              background: Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
          Text.rich(TextSpan(
            children: [
              TextSpan(
                text: 'Home-',
              ),
              TextSpan(
                text: 'https://flutter.cn',
                style: TextStyle(
                  color: Colors.blue,
                ),
                recognizer: null,
              )
            ],
          )),
          // 继承默认样式
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('hello world'),
                Text('I am Jack'),
                Text('I am Jack',
                  style: TextStyle(
                    inherit: false,
                    color: Colors.grey,
                    fontSize: 32.0,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'hello world - normal fonts',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Text(
            'hello world - Raleway normal fonts',
            style: TextStyle(
                fontFamily: 'Releway',
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                package: 'basic_widget_package'
            ),
          ),
          Text(
            'hello world - Raleway medium fonts',
            style: TextStyle(
                fontFamily: 'Releway',
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                package: 'basic_widget_package'
            ),
          ),
          Text(
            'hello world - Raleway bold fonts',
            style: TextStyle(
                fontFamily: 'Releway',
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                package: 'basic_widget_package'
            ),
          )
        ],
      ),
    );
  }
}