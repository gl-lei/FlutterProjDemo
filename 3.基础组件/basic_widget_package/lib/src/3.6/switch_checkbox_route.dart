import 'package:flutter/material.dart';

class SwitchCheckboxRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchCheckboxRouteState();
  }
}

class _SwitchCheckboxRouteState extends State<SwitchCheckboxRoute> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  void _switchValueChanged(bool newValue) {
    setState(() {
      _switchSelected = newValue;
    });
  }

  void _checkboxValueChanged(bool newValue) {
    setState(() {
      _checkboxSelected = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch CheckBox Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: _switchSelected,
              onChanged: _switchValueChanged,
            ),
            Checkbox(
              value: _checkboxSelected,
              onChanged: _checkboxValueChanged,
              activeColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}