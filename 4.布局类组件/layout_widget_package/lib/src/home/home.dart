import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Row Column 示例'),
              onPressed: () => Navigator.of(context).pushNamed('4_row_column_route'),
            ),
            RaisedButton(
              child: Text('Flex 示例'),
              onPressed: () => Navigator.of(context).pushNamed('4_flex_route'),
            ),
            RaisedButton(
              child: Text('Wrap Flow 示例'),
              onPressed: () => Navigator.of(context).pushNamed('4_wrap_flow_route'),
            ),
            RaisedButton(
              child: Text('Stack Position 绝对定位示例'),
              onPressed: () => Navigator.of(context).pushNamed('4_stack_position_route'),
            ),
            RaisedButton(
              child: Text('Align 相对定位示例'),
              onPressed: () => Navigator.of(context).pushNamed('4_align_route'),
            ),
          ],
        ),
      ),
    );
  }
}