import 'package:flutter/material.dart';

class StackPositionRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Position Route'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,//未指定定位或部分定位widget的对齐方式
          fit: StackFit.loose,//没有定位的子组件如何去适应Stack的大小 loose表示使用子组件的大小
          children: <Widget>[
            Container(
              child: Text(
                'hello world',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text('I am Jack'),
            ),
            Positioned(
              top: 18.0,
              child: Text('your friend'),
            ),
          ],
        ),
      ),
    );
  }
}