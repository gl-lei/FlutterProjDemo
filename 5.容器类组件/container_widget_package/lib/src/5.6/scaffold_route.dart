import 'dart:math';

import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaffoldRouteState();
  }
}

class _ScaffoldRouteState extends State<ScaffoldRoute> with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  TabController _tabController;
  List _tabs = ['新闻', '历史', '图片'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        centerTitle: true,
        actions: <Widget>[
          // 导航栏右侧菜单
          IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop(),),
          IconButton(icon: Icon(Icons.share), onPressed: () {},),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs.map((e) => Tab(text: e,)).toList(),
        ),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 5,
            ),
          );
        }).toList(),
      ),
      /*
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),*/
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),//底部导航栏打一个圆形的洞
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home),),
            SizedBox(),//中间位置空出
            IconButton(icon: Icon(Icons.business),),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,//均分底部导航栏横向空间
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.asset(
                          'images/avatar.png',
                          width: 80,
                          package: 'container_widget_package',
                        ),
                      ),
                    ),
                    Text('Wendux', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Add account'),
                      leading: const Icon(Icons.add),
                    ),
                    ListTile(
                      title: const Text('Manage accounts'),
                      leading: const Icon(Icons.settings),
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}