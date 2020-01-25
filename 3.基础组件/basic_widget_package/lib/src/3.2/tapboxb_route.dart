import 'package:flutter/material.dart';

class TapBoxBParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TapBoxBParentWidgetState();
  }
}

class _TapBoxBParentWidgetState extends State<TapBoxBParentWidget> {
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
        title: Text('状态管理-父Widget管理'),
      ),
      body: TapBoxBRoute(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapBoxBRoute extends StatelessWidget {
  TapBoxBRoute({Key key, this.active: false, @required this.onChanged}): super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
          child: Center(
            child: Text(
              active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}