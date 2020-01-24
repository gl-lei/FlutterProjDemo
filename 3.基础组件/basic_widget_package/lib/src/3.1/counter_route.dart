import 'package:flutter/material.dart';

class CounterRoute extends StatefulWidget {
  CounterRoute({Key key, this.initValue: 0}): super(key: key);

  final int initValue;

  @override
  State<StatefulWidget> createState() {
    return _CounterRouteState();
  }
}

class _CounterRouteState extends State<CounterRoute> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState...");
  }

  @override
  Widget build(BuildContext context) {
    print("build...");
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter route'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => setState(() => ++_counter),
          child: Text('$_counter'),
          color: Colors.teal,
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterRoute oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget...");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive...");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose...");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble...");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies...");
  }
}