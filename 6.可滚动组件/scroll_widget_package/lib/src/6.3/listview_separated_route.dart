import 'package:flutter/material.dart';

class ListViewSeparatedRoute extends StatelessWidget {
  // 下划线预定义
  final Widget divider1 = const Divider(color: Colors.blue,);
  final Widget divider2 = const Divider(color: Colors.green,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView Route'),
        ),
        body: ListView.separated(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(title: Text('$index'),);
          },
          separatorBuilder: (context, index) {
            return index % 2 == 0 ? divider1 : divider2;
          },
        ),
    );
  }
}