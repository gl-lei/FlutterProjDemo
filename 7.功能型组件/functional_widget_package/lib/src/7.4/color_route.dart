import 'package:flutter/material.dart';

/// 颜色字符串转换为Color对象
Color _colorWithRGBHexStr(String hexStr) {
  //正常Color表示为ARGB形式
  var color = Color(0xffdc380d);
  // radix表示进制
  color = Color(int.parse(hexStr, radix: 16) | 0xFF000000);
  color = Color(int.parse(hexStr, radix: 16)).withAlpha(255);
  return color;
}

/// 颜色亮度，Color类中提供了一个 computeLuminance() 方法，返回一个[0-1]的一个值
/// 数字越大颜色就越浅
class NavBar extends StatelessWidget {
  final String title;
  final Color color;//背景颜色

  NavBar({
    Key key,
    this.color,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          )
        ]
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          // 根据背景色亮度来确定Title颜色
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}

/// 示例
class ColorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Route'),
      ),
      body: Column(
        children: <Widget>[
          // 背景为蓝色，则title自动为白色
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: NavBar(color: Colors.blue, title: '标题',),
          ),
          // 背景为白色，则title自动为黑色
          NavBar(color: Colors.white, title: '标题',),
        ],
      ),
    );
  }
}