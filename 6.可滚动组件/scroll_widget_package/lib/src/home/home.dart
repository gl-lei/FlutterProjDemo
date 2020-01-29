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
            child: Text('SingleChildScrollView Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_single_child_scrollview_route'),
          ),
          RaisedButton(
            child: Text('ListView Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_listview_route'),
          ),
          RaisedButton(
            child: Text('ListView Sliver Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_listview_sliver_route'),
          ),
          RaisedButton(
            child: Text('ListView Separated Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_listview_separated_route'),
          ),
          RaisedButton(
            child: Text('ListView Infinite Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_listview_infinite_route'),
          ),
          RaisedButton(
            child: Text('GridView Fixed Count Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_gridview_fixed_route'),
          ),
          RaisedButton(
            child: Text('GridView Quick Fixed Count Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_gridview_quick_fixed_route'),
          ),
          RaisedButton(
            child: Text('GridView Max Extent Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_gridview_max_extent_route'),
          ),
          RaisedButton(
            child: Text('GridView Max Extent Quick Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_gridview_max_extent_quick_route'),
          ),
          RaisedButton(
            child: Text('GridView Builder Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_gridview_builder_route'),
          ),
          RaisedButton(
            child: Text('Custom ScrollView Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_custom_scrollview_route'),
          ),
          RaisedButton(
            child: Text('ScrollController Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_scrollcontroller_route'),
          ),
          RaisedButton(
            child: Text('ScrollController Notification Route'),
            onPressed: () => Navigator.of(context).pushNamed('6_scrollcontroller_notification_route'),
          ),
        ],
      ),
    );
  }
}