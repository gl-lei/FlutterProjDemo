import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Route'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          RaisedButton(
            child: Text('PopScope Route'),
            onPressed: () => Navigator.of(context).pushNamed('7_popscope_route'),
          ),
          RaisedButton(
            child: Text('Inherited Route'),
            onPressed: () => Navigator.of(context).pushNamed('7_inherited_route'),
          ),
          RaisedButton(
            child: Text('Provider Route'),
            onPressed: () => Navigator.of(context).pushNamed('7_provider_route'),
          ),
          RaisedButton(
            child: Text('Color Route'),
            onPressed: () => Navigator.of(context).pushNamed('7_color_route'),
          ),
          RaisedButton(
            child: Text('Theme Route'),
            onPressed: () => Navigator.of(context).pushNamed('7_theme_route'),
          ),
          RaisedButton(
            child: Text('FutureBuilder Route'),
            onPressed: () => Navigator.of(context).pushNamed('7_futurebuilder_route'),
          ),
          RaisedButton(
            child: Text('StreamBuilder Route'),
            onPressed: () => Navigator.of(context).pushNamed('7_streambuilder_route'),
          ),
          RaisedButton(
            child: Text('Dialog Route'),
            onPressed: () => Navigator.of(context).pushNamed('7_dialog_route'),
          ),
        ],
      ),
    );
  }
}