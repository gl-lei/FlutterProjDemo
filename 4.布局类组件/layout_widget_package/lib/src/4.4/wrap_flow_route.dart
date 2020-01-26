import 'package:flutter/material.dart';

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    // 计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class WrapFlowRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Flow Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0,//主轴方向间距
              runSpacing: 4.0,//纵轴方向间距
              alignment: WrapAlignment.center,//沿主轴方向居中
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A'),),
                  label: Text('Hamilton'),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M'),),
                  label: Text('Lafayette'),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H'),),
                  label: Text('Mulligan'),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J'),),
                  label: Text('Laurens'),
                ),
              ],
            ),
            Flow(
              delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
              children: <Widget>[
                Container(width: 80.0, height: 80.0, color: Colors.red,),
                Container(width: 80.0, height: 80.0, color: Colors.green,),
                Container(width: 80.0, height: 80.0, color: Colors.blue,),
                Container(width: 80.0, height: 80.0, color: Colors.yellow,),
                Container(width: 80.0, height: 80.0, color: Colors.brown,),
                Container(width: 80.0, height: 80.0, color: Colors.purple,),
              ],
            )
          ],
        ),
      ),
    );
  }
}