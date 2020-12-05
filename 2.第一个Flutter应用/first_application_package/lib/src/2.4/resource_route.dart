import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResourceRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 注意，如果是在package中，则需要如下编写，如果是在Application中则不需要
    var path = 'packages/first_application_package/assets/json/test.txt';
    rootBundle.loadString(path).then((value) => print(value));

    // DefaultAssetBundle根据上下文（例如设备分辨率）加载不同的文件
    DefaultAssetBundle.of(context).loadString(path).then((value) => print(value));

    return Scaffold(
      appBar: AppBar(
        title: Text('Resource Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/kq_fg.png', package: 'first_application_package',),
            DecoratedBox(
              child: Text('This is my test', style: TextStyle(fontSize: 16, color: Colors.red),),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/hw_fg.png', package: 'first_application_package'),
                ),
              ),
            ),
            FutureBuilder(
              future: rootBundle.loadString(path),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // 判断已经返回数据，则直接进行展示
                  return Text(snapshot.data.toString(), style: TextStyle(fontSize: 26, color: Colors.blue),);
                } else {
                  return Text('加载中...', style: TextStyle(fontSize: 26),);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}