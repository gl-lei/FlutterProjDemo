import 'package:flutter/material.dart';

class TapBoxCParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TapBoxCParentWidgetState();
  }
}

class _TapBoxCParentWidgetState extends State<TapBoxCParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('混合状态管理'),
      ),
      body: TapBoxCRoute(active: _active, onChanged: _handleTapboxChanged,),
    );
  }
}

class TapBoxCRoute extends StatefulWidget {
  TapBoxCRoute({Key key, this.active: false, @required this.onChanged}): super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() {
    return _TapBoxCRouteState();
  }
}

class _TapBoxCRouteState extends State<TapBoxCRoute> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _handleTap,
        onTapUp: _handleTapUp,
        onTapDown: _handleTapDown,
        onTapCancel: _handleTapCancel,
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight ? Border.all(
              color: Colors.teal[700],
              width: 10.0
            ) : null,
          ),
          child: Center(
            child: Text(
              widget.active ? 'Active' : 'InActive',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}