import 'package:flutter/material.dart';
import 'package:functional_widget_package/src/7.3/provider/consumer.dart';

import '../provider/change_notifier_provider.dart';
import '../provider/consumer.dart';
import '../model/cart_model.dart';
import '../model/item.dart';


class ProviderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProviderRouteState();
  }
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Route'),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<CartModel>(
                  builder: (context, cart) => Text('总价：${cart.totalPrice}'),
                ),
                Builder(builder: (context) {
                  print('RaisedButton build');
                  return RaisedButton(
                    child: Text('添加商品'),
                    onPressed: () {
                      var item = Item(20.0, 1);
                      ChangeNotifierProvider.of<CartModel>(context, listen: false).add(item);
                    },
                  );
                },),
              ],
            );
          },),
        ),
      ),
    );
  }
}