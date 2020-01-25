import 'package:flutter/material.dart';

class ButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => print('press...'),
              child: Text('Raise Button'),
            ),
            FlatButton(
              onPressed: () => print('press...'),
              child: Text('Flat Button'),
            ),
            OutlineButton(
              onPressed: () => print('press...'),
              child: Text('Outline Button'),
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () => print('press...'),
            ),
            RaisedButton.icon(
                onPressed: () => print('press...'),
                icon: Icon(Icons.send),
                label: Text('发送'),
            ),
            OutlineButton.icon(
                onPressed: () => print('press...'),
                icon: Icon(Icons.add),
                label: Text('添加')
            ),
            FlatButton.icon(
                onPressed: () => print('press...'),
                icon: Icon(Icons.info),
                label: Text('详情'),
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text('Submit'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => print('press...'),
            )
          ],
        ),
      ),
    );
  }
}