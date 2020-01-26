import 'package:flutter/material.dart';

class FlexRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flex Route'),
      ),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}