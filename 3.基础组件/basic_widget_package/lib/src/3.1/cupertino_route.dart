import 'package:flutter/cupertino.dart';

class CupertinoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino Demo'),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text('Press'),
          onPressed: () => print('press...'),
        ),
      ),
    );
  }
}