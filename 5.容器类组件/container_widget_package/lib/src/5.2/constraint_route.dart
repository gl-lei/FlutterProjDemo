import 'package:flutter/material.dart';

class ConstraintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Constraint Route'),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,  // 宽度尽可能大
                minHeight: 50.0,
              ),
              child: Container(
                height: 5.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.red
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.green
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200.0,
              child: AspectRatio(
                aspectRatio: 2/1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.purple
                  ),
                ),
              )
            )
          ],
        ),
      )
    );
  }
}