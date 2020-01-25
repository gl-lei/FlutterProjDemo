import 'package:flutter/material.dart';

class TapBoxARoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TapBoxARouteState();
  }
}

class _TapBoxARouteState extends State<TapBoxARoute> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('状态管理 - 自己管理'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _handleTap,
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: _active ? Colors.lightGreen[700] : Colors.grey[600],
            ),
            child: Center(
              child: Text(
                _active ? 'Active' : 'InActive',
                style: TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}