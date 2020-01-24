import 'package:flutter/material.dart';

class ResourceRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resource Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/hw_fg.png', package: 'first_application_package',),
            DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/hw_fg.png', package: 'first_application_package'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}