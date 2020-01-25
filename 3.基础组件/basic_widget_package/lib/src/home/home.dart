import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Route'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Widget 状态'),
                onPressed: () => Navigator.of(context).pushNamed('3_counter_route'),
              ),
              RaisedButton(
                child: Text('通过context获取state'),
                onPressed: () => Navigator.of(context).pushNamed('3_state_route'),
              ),
              RaisedButton(
                child: Text('通过Global Key获取state'),
                onPressed: () => Navigator.of(context).pushNamed('3_global_state_route'),
              ),
              RaisedButton(
                child: Text('Cupertino 风格'),
                onPressed: () => Navigator.of(context).pushNamed('3_cupertino_state_route'),
              ),
              RaisedButton(
                child: Text('状态管理-自己管'),
                onPressed: () => Navigator.of(context).pushNamed('3_tapboxa_route'),
              ),
              RaisedButton(
                child: Text('状态管理-父Widget管理'),
                onPressed: () => Navigator.of(context).pushNamed('3_tapboxb_route'),
              ),
              RaisedButton(
                child: Text('状态管理-混合管理'),
                onPressed: () => Navigator.of(context).pushNamed('3_tapboxc_route'),
              ),
              RaisedButton(
                child: Text('文字样式'),
                onPressed: () => Navigator.of(context).pushNamed('3_text_route'),
              ),
              RaisedButton(
                child: Text('按钮样式'),
                onPressed: () => Navigator.of(context).pushNamed('3_button_route'),
              ),
              RaisedButton(
                child: Text('图片以及icon'),
                onPressed: () => Navigator.of(context).pushNamed('3_image_icon_route'),
              ),
              RaisedButton(
                child: Text('单选框和复选框'),
                onPressed: () => Navigator.of(context).pushNamed('3_switch_checkbox_route'),
              ),
              RaisedButton(
                child: Text('输入框'),
                onPressed: () => Navigator.of(context).pushNamed('3_textfield_route'),
              ),
              RaisedButton(
                child: Text('表单'),
                onPressed: () => Navigator.of(context).pushNamed('3_form_route'),
              ),
              RaisedButton(
                child: Text('进度指示器'),
                onPressed: () => Navigator.of(context).pushNamed('3_progress_route'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}