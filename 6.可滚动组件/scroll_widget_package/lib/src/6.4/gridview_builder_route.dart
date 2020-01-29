import 'package:flutter/material.dart';

class GridViewBuilderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridViewBuilderRouteState();
  }
}

class _GridViewBuilderRouteState extends State<GridViewBuilderRoute> {
  /// 保存icon数据
  List<IconData> _icons = [];

  /// 模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _icons.addAll([
        Icons.ac_unit,
        Icons.airport_shuttle,
        Icons.all_inclusive,
        Icons.beach_access,
        Icons.cake,
        Icons.free_breakfast,
      ]);
      setState(() {
        // 刷新数据
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Builder Route'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        },
      ),
    );
  }
}