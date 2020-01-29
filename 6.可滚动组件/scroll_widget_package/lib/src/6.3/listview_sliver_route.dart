import 'package:flutter/material.dart';

class ListViewSliverRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Route'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text('$index'),);
        },
      )
    );
  }
}