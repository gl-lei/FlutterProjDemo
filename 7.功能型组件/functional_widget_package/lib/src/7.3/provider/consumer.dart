import 'package:flutter/material.dart';

import 'change_notifier_provider.dart';

/// 消费者封装
class Consumer<T> extends StatelessWidget {
  Consumer({Key key, @required this.builder}): assert(builder != null), super(key: key);

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context),//自动获取Model数据
    );
  }
}