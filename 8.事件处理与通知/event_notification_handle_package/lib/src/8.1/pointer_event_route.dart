import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointerEventRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PointerEventRouteState();
  }
}

/// 点击效果默认，子组件接受点击
class _PointerEventRouteState extends State<PointerEventRoute> {
  // 定义状态，保存当前指针位置
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PointerEvent Route'),
      ),
      body: Center(
        child: Listener(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 300.0,
            height: 150.0,
            child: Text(_event?.toString() ?? '', style: TextStyle(color: Colors.white),),
          ),
          onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
          onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
          onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
        ),
      ),
    );
  }
}

/// 点击区域不透明
class PointerEventOpaqueRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PointerEvent Opaque Route'),
      ),
      body: Center(
        child: Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(300.0, 150.0)),
            child: Center(
              child: Text('Box A'),
            ),
          ),
          onPointerDown: (event) => print('down A'),
          behavior: HitTestBehavior.opaque,
        ),
      ),
    );
  }
}

/// 点击区域半透明
class PointerEventTranslucentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PointerEvent Translucent Route'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ),
              onPointerDown: (event) => print('down0'),
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                child: Center(
                  child: Text('左上角200*100范围内非文本区域点击'),
                ),
              ),
              onPointerDown: (event) => print('down1'),
              // 点击组件透明区域时，顶部组件和底部组件都可以接收到事件
              behavior: HitTestBehavior.translucent,
            ),
          ],
        ),
      ),
    );
  }
}

/// 忽略PointerEvent
/// IgnorePointer与AbsorbPointer都能阻止子树接收指针事件，不同之处在于：
/// AbsorbPointer本身参与命中测试（接收指针事件），而IgnorePointer本身不会参与
class PointerEventIgnoreRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PointerEvent Ignore Route'),
      ),
      body: Center(
        child: Listener(
          child: AbsorbPointer(
            child: Listener(
              child: Container(
                color: Colors.red,
                width: 200.0,
                height: 100.0,
              ),
              onPointerDown: (event) => print('in'),
            ),
          ),
          onPointerDown: (event) => print('up'),
        ),
      ),
    );
  }
}