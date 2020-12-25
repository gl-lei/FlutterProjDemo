import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 基础信息channel
  final BasicMessageChannel _basicChannel = BasicMessageChannel<String>('foo_1', StringCodec());

  // 方法通道
  final MethodChannel _methodChannel = MethodChannel('foo_2');

  // 事件通道
  final EventChannel _eventChannel = EventChannel('foo_3');

  @override
  void initState() {
    super.initState();

    // 通道名称确保唯一性；Channel名称需要保持唯一性，例如：some.body.example.com/sensors/foo
    // 表示某人(some.body)开发的sensors插件使用了foo通道
    _registerBinaryMessageHandler();
    _registerBasicMessageChannelHandler();
    _registerMethodChannelHandler();
    _registerEventChannelHandler();
    _registerEventChannelHandler();
  }

  // 通过二进制消息信使，发送二进制数据
  void _clickBinaryMessageBtn() async {
    debugPrint('binaryMessage...');
    // 发送3.14159和12345678数据
    final WriteBuffer buffer = WriteBuffer();
    buffer.putFloat64(3.14159);
    buffer.putInt32(12345678);

    // 使用二进制消息信使发送消息，指定消息通道名称
    final ByteData message = buffer.done();
    await ServicesBinding.instance.defaultBinaryMessenger.send('foo', message);
    print('message send by binary messenger, replay ignored');
  }

  // 二进制消息响应
  void _registerBinaryMessageHandler() {
    ServicesBinding.instance.defaultBinaryMessenger.setMessageHandler('foo', (message) async {
      final ReadBuffer readBuffer = ReadBuffer(message);
      final double x1 = readBuffer.getFloat64();
      final int y1 = readBuffer.getInt32();
      print('Received $x1 and $y1');

      // 使用完成之后，重置为nil
      ServicesBinding.instance.defaultBinaryMessenger.setMessageHandler('foo', null);
      return null;
    });
  }

  // 基础信息通道
  void _clickBasicMessageChannelBtn() async {
    final String reply = await _basicChannel.send('hello, this is dart.');
    print(reply);

    /*
    // 上面的代码就相当于对binaryMessenger进行了一层封装
    const codec = StringCodec();
    final ByteData message = codec.encodeMessage('hello, this is dart.');
    final ByteData replyMessage = await ServicesBinding.instance.defaultBinaryMessenger.send('foo_1', message);
    print(codec.decodeMessage(replyMessage));*/
  }

  // 基础消息通道响应
  void _registerBasicMessageChannelHandler() {
    _basicChannel.setMessageHandler((message) async {
      print('Received: $message');
      return 'Hi from dart';
    });

    /*
    // 上面的代码就相当于对binaryMessenger进行了一层封装
    ServicesBinding.instance.defaultBinaryMessenger.setMessageHandler('foo_1', (message) async {
      const codec = StringCodec();
      final String str = codec.decodeMessage(message);
      print('Received: $str');
      return codec.encodeMessage('Hi from dart');
    });*/
  }

  // 方法通道
  void _clickMethodChannelBtn() async {
    const name = 'bar';
    const value = 'world';
    try {
      final String greeting = await _methodChannel.invokeMethod(name, value);
      print(greeting);
    } on PlatformException catch(e) {
      print('$name failed: ${e.message}');
    } on MissingPluginException {
      print('$name not implemented');
    }

  }

  // 方法通道响应
  void _registerMethodChannelHandler() {
    _methodChannel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'bar':
          return 'Hello, ${call.arguments}';
        case 'baz':
          throw PlatformException(code: '400', message: 'This is bad');
        default:
          throw MissingPluginException();
      }
    });
  }

  // Event Channel监听
  void _registerEventChannelHandler() {
    _eventChannel.receiveBroadcastStream().listen((event) {
      print('Received event: $event');
    }, onError: (error) {
      print('Received error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Binary Message'),
              onPressed: _clickBinaryMessageBtn,
            ),
            RaisedButton(
              child: Text('BasicMessage Channel'),
              onPressed: _clickBasicMessageChannelBtn,
            ),
            RaisedButton(
              child: Text('Method Channel'),
              onPressed: _clickMethodChannelBtn,
            )
          ],
        ),
      ),
    );
  }
}
