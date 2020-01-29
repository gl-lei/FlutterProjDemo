import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListViewInfiniteRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewInfiniteRouteState();
  }
}

class _ListViewInfiniteRouteState extends State<ListViewInfiniteRoute> {
  /// 表尾标记
  static const loadingTag = '##loading##';
  var _words = <String>[loadingTag];

  /// 模拟网络加载数据
  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
        _words.length-1,
        generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        // 重新构建列表
      });
    });
  }
  
  @override
  void initState() {
    super.initState();
    _retrieveData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Infinist Route'),
      ),
      body: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: .1)),
            ),
            child: ListTile(title: Text('商品列表'),),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _words.length,
              itemBuilder: (context, index) {
                // 如果到了表尾
                if (_words[index] == loadingTag) {
                  if (_words.length - 1 < 100) {
                    // 不足100条，继续获取数据
                    _retrieveData();
                    // 加载时显示loading
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: CircularProgressIndicator(strokeWidth: 2.0,),
                      ),
                    );
                  } else {
                    // 已经加载了100条数据，不再获取数据
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16.0),
                      child: Text('没有更多了', style: TextStyle(color: Colors.grey),),
                    );
                  }
                }
                // 显示单词列表项
                return ListTile(title: Text(_words[index]),);
              },
              separatorBuilder: (context, index) => Divider(height: .0,),
            ),
          ),
        ],
      )
    );
  }
}