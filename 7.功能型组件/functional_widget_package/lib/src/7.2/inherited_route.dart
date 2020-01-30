import 'package:flutter/material.dart';

/// 计数器点击次数保存在此widget中
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}): super(child: child);

  // 需要在子树中共享的数据，保存点击次数
  final int data;

  // 定义便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    // 调用下面的方法将不会注册依赖，当InheritedWidget发生变化时，不会更新子孙组件
//    return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget;

    // 调用此方法会注册依赖
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // 如果返回true，则子树中依赖此widget的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.data != data;
  }
}

/// 依赖InheritedWidget的子widget
class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 父或者祖先widget中的InheritedWidget改变时会被调用。
    // 如果build中没有依赖InheritedWidget，则此回调不会被调用
    print('TestWidgetState Dependencies change');
  }

  @override
  Widget build(BuildContext context) {
    ShareDataWidget shareData = ShareDataWidget.of(context);
    return Text(
      shareData != null ? shareData.data.toString() : 'null',
      textScaleFactor: 4,
    );
  }
}

class InheritedRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InheritedRouteState();
  }
}

class _InheritedRouteState extends State<InheritedRoute> {
  int _count = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 父或祖先widget中的InheritedWidget改变时会被调用，如果build中没有依赖InheritedWidget，则此回调不会被调用
    print('InheritedRouteState Dependencies change');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Widget'),
      ),
      body: Center(
        child: ShareDataWidget(
          data: _count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(),
              ),
              RaisedButton(
                child: Text('Increment'),
                onPressed: () => setState(() => ++_count),
              ),
            ],
          ),
        ),
      ),
    );
  }
}