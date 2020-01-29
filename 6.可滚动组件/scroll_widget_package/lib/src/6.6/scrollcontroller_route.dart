import 'package:flutter/material.dart';

class ScrollControllerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerRouteState();
  }
}

class _ScrollControllerRouteState extends State<ScrollControllerRoute> {
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // 避免内存泄露
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollController Route'),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 50.0,// 指定列表的高度
          itemBuilder: (context, index) {
            return ListTile(title: Text('$index'),);
          },
          controller: _controller,
        ),
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () => _controller.animateTo(.0, duration: Duration(milliseconds: 200), curve: Curves.ease),
      ),
    );
  }
}