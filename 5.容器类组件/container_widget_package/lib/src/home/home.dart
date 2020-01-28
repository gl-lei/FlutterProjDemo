import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Route'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: double.infinity,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('填充（padding）Widget'),
                  onPressed: () => Navigator.of(context).pushNamed('5_padding_route'),
                ),
                RaisedButton(
                  child: Text('尺寸限制类容器（constraint）Widget'),
                  onPressed: () => Navigator.of(context).pushNamed('5_constraint_route'),
                ),
                RaisedButton(
                  child: Text('装饰容器（decorated）Widget'),
                  onPressed: () => Navigator.of(context).pushNamed('5_decorated_box_route'),
                ),
                RaisedButton(
                  child: Text('变换（transform）Widget'),
                  onPressed: () => Navigator.of(context).pushNamed('5_transform_route'),
                ),
                RaisedButton(
                  child: Text('Container Widget'),
                  onPressed: () => Navigator.of(context).pushNamed('5_container_route'),
                ),
                RaisedButton(
                  child: Text('Scaffold Widget'),
                  onPressed: () => Navigator.of(context).pushNamed('5_scaffold_route'),
                ),
                RaisedButton(
                  child: Text('Clip Route'),
                  onPressed: () => Navigator.of(context).pushNamed('5_clip_route'),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}