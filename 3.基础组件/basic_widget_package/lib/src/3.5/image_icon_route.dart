import 'package:flutter/material.dart';

// 自定义icon font 字体
class MyIcons {
  // youtube 图标
  static const IconData youtube = const IconData(
    0xE65E,
    fontFamily: 'IconFont',
    fontPackage: 'basic_widget_package',
    matchTextDirection: true,
  );

  // github 图标
  static const IconData github = const IconData(
    0xE65F,
    fontFamily: 'IconFont',
    fontPackage: 'basic_widget_package',
    matchTextDirection: true,
  );

  // twitter 图标
  static const IconData twitter = const IconData(
    0xE660,
    fontFamily: 'IconFont',
    fontPackage: 'basic_widget_package',
    matchTextDirection: true,
  );

  // applets 图标
  static const IconData applets = const IconData(
    0xE661,
    fontFamily: 'IconFont',
    fontPackage: 'basic_widget_package',
    matchTextDirection: true,
  );

  // 扇子 图标
  static const IconData fan = const IconData(
    0xE662,
    fontFamily: 'IconFont',
    fontPackage: 'basic_widget_package',
    matchTextDirection: true,
  );

  // 红包 图标
  static const IconData redPacket = const IconData(
    0xE668,
    fontFamily: 'IconFont',
    fontPackage: 'basic_widget_package',
    matchTextDirection: true,
  );

  // 酒 图标
  static const IconData wine = const IconData(
    0xE669,
    fontFamily: 'IconFont',
    fontPackage: 'basic_widget_package',
    matchTextDirection: true,
  );

  // 舞狮 图标
  static const IconData lionDance = const IconData(
    0xE66A,
    fontFamily: 'IconFont',
    fontPackage: 'basic_widget_package',
    matchTextDirection: true,
  );
}

class ImageIconRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 使用的图像
    final image = AssetImage('images/avatar.png', package: 'basic_widget_package');

    // icon font
    String icons = '';
    // accesible icon: &#xE914; or 0xE914 or E914
    icons += '\uE914';
    // error icon: &#xE000; or 0xE000 or E000
    icons += '\uE000';
    // fingerprint icon: &#xE90D; or 0xE90D or E90D
    icons += '\uE90D';

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Icon Route'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Image>[
            Image(
              image: image,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fill,
            ),
            Image(
              image: image,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.contain,
            ),
            Image(
              image: image,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
            Image(
              image: image,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fitWidth,
            ),
            Image(
              image: image,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fitHeight,
            ),
            Image(
              image: image,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.scaleDown,
            ),
            Image(
              image: image,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.none,
            ),
            Image(
              image: image,
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              fit: BoxFit.fill,
            ),
            Image(
              image: image,
              width: 100.0,
              height: 200.0,
              repeat: ImageRepeat.repeatY,
            )
          ].map((e) {
            return Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: SizedBox(
                    width: 100.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                          color: Colors.teal[700],
                          width: 1.0,
                        ),
                      ),
                      child: e,
                    ),
                  ),
                ),
                Text(e.fit.toString()),
              ],
            );
          }).toList() + [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    icons,
                    style: TextStyle(
                      fontFamily: 'MaterialIcons',
                      fontSize: 24.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Text('icon fonts'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.accessible, color: Colors.green,),
                Icon(Icons.error, color: Colors.green,),
                Icon(Icons.fingerprint, color: Colors.green,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(MyIcons.youtube, color: Colors.teal,),
                Icon(MyIcons.github, color: Colors.teal,),
                Icon(MyIcons.twitter, color: Colors.teal,),
                Icon(MyIcons.applets, color: Colors.teal,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(MyIcons.fan, color: Colors.red,),
                Icon(MyIcons.redPacket, color: Colors.red,),
                Icon(MyIcons.wine, color: Colors.red,),
                Icon(MyIcons.lionDance, color: Colors.red[700],),
              ],
            )
          ],
        ),
      )
    );
  }
}