import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}): super(child: child);

  // 共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // 简单返回true，每次更新都会调用依赖其的子孙节点的`didChangeDependencies`
    return true;
  }
}

/// 数据保存的地方有了，接下来我们需要做的就是数据发生变化的时候重新构建 InheritedProvider
/// 那么，现在就面临两个问题
///
/// 1.数据发生变化怎么通知？
/// 2.谁来重新构建 InheritedProvider?
///
/// 解答：
/// 1.使用EventBus来进行事件通知或者使用ChangeNotifier类，建议使用ChangeNotifier类。model类继承自ChangeNotifier
/// 数据发生变化时，直接通过ChangeNotifier的notifyListeners()方法来进行通知
/// 2.由model类来进行通知，订阅者负责重新构建 InheritedProvider