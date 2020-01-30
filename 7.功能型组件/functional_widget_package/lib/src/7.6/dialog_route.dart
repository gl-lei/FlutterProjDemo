import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogRoute extends StatelessWidget {

  /// 弹出对话框
  Future<bool> showDeleteConfirmDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('您确定要删除当前文件吗？'),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(false),//关闭对话框，返回false
            ),
            FlatButton(
              child: Text('删除'),
              onPressed: () => Navigator.of(context).pop(true),//关闭对话框并返回true
            ),
          ],
        );
      }
    );
  }

  /// SimpleDialog展示列表，用于展示一个列表的场景
  Future<int> showLanguageDialog(BuildContext context) {
    return showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.of(context).pop(1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 返回2
                Navigator.of(context).pop(2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('美国英语'),
              ),
            )
          ],
        );
      }
    );
  }

  /// 直接使用Dialog展示列表项
  Future<int> showListDialog(BuildContext context) {
    return showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text('请选择'),),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('$index'),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              ),
            )
          ],
        );

        // 使用 AlertDialog 会报错
        return Dialog(child: child,);
      },
    );
  }

  /// 不返回Dialog，返回自定义的widget也是可以的
  Future<int> showCustomListDialog(BuildContext context) {
    return showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text('请选择'),),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('$index'),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              ),
            )
          ],
        );

        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 280),
            child: Material(
              child: child,
              type: MaterialType.card,
            ),
          ),
        );
      },
    );
  }

  /// 自定义弹出对话框样式
  Future<bool> showCustomConfirmDialog(BuildContext context) {
    return showCustomDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('您确定要删除当前文件吗？'),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () => Navigator.of(context).pop(false),//关闭对话框，返回false
              ),
              FlatButton(
                child: Text('删除'),
                onPressed: () => Navigator.of(context).pop(true),//关闭对话框并返回true
              ),
            ],
          );
        }
    );
  }

  /// 对话框状态管理
  Future<bool> showDeleteConfirmDialog2(BuildContext context, {bool withTree = false}) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提示'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('您确定要删除当前文件吗？'),
              Row(
                children: <Widget>[
                  Text('同时删除子目录？'),
                  StatefulBuilder(builder: (context, _setState) {
                    return Checkbox(
                      value: withTree,
                      onChanged: (bool value) {
                        _setState(() {
                          withTree = value;
                        });
                      },
                    );
                  },),
                ],
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('删除'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      }
    );
  }

  ///对话框状态管理，更加优雅
  Future<bool> showDeleteConfirmDialog3(BuildContext context, {bool withTree = false}) {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('您确定要删除当前文件吗？'),
                Row(
                  children: <Widget>[
                    Text('同时删除子目录？'),
                    Builder(builder: (context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (bool value) {
                          // 通过将 Element 标记为dirty来实现刷新，通过
                          // markNeedsBuild() 方法来让其刷新
                          (context as Element).markNeedsBuild();
                          withTree = value;
                        },
                      );
                    },),
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('删除'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          );
        }
    );
  }

  /// 底部菜单列表模态对话框(半屏)
  Future<int> showModalBottomSheetDiglog(BuildContext context) {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('$index'),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      }
    );
  }

  /// 全屏模态视图，要求父级组件中有 Scaffold
  PersistentBottomSheetController<int> showBottomSheetController(BuildContext context) {
    return showBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index'),
              onTap: () => Navigator.of(context).pop(),
            );
          },
        );
      },
    );
  }

  /// Loading框 showDialog + AlertDialog来自定义
  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text('正在加载，请稍后...'),
              )
            ],
          ),
        );
      },
    );
  }

  /// 自定义Loading框的大小
  void showCustomLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text('正在加载，请稍后...'),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  /// 日历Dialog
  Future<DateTime> showDatePickerDialog(BuildContext context) {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(
        Duration(days: 30),
      ),
    );
  }

  /// iOS日历风格Dialog
  Future<DateTime> showCupertinoDatePickerDialog(BuildContext context) {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(Duration(days: 30)),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      }
    );
  }

  /// 自定义对话框打开动画及遮罩
  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder}) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);

    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder,);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null ? Theme(data: theme, child: pageChild,) : pageChild;
          },),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87,//自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions
    );
  }

  /// 自定义缩放动画
  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Route'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: double.infinity,
          ),
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Alert Dialog'),
                onPressed: () async {
                  // 弹出对话框并等待其关闭
                  bool delete = await showDeleteConfirmDialog(context);
                  if (delete == null || !delete) {
                    print('取消删除');
                  } else {
                    print('已确认删除');
                  }
                },
              ),
              RaisedButton(
                child: Text('Simple Dialog'),
                onPressed: () async {
                  int i = await showLanguageDialog(context);
                  if (i != null) {
                    print('选择了：${i == 1 ? "中文简体": "美国英语"}');
                  }
                },
              ),
              RaisedButton(
                child: Text('List Dialog'),
                onPressed: () async {
                  int index = await showListDialog(context);
                  if (index != null) {
                    print('点击了：$index');
                  }
                },
              ),
              RaisedButton(
                child: Text('Custom Dialog'),
                onPressed: () async {
                  int index = await showCustomListDialog(context);
                  if (index != null) {
                    print('点击了：$index');
                  }
                },
              ),
              RaisedButton(
                child: Text('Custom Dialog Style'),
                onPressed: () async {
                  // 弹出对话框并等待其关闭
                  bool delete = await showCustomConfirmDialog(context);
                  if (delete == null || !delete) {
                    print('取消删除');
                  } else {
                    print('已确认删除');
                  }
                },
              ),
              RaisedButton(
                child: Text('Dialog State'),
                onPressed: () async {
                  bool delete = await showDeleteConfirmDialog2(context);
                  if (delete == null || !delete) {
                    print('取消删除');
                  } else {
                    print('确定删除');
                  }
                },
              ),
              RaisedButton(
                child: Text('Dialog State更优雅'),
                onPressed: () async {
                  bool delete = await showDeleteConfirmDialog3(context);
                  if (delete == null || !delete) {
                    print('取消删除');
                  } else {
                    print('确定删除');
                  }
                },
              ),
              RaisedButton(
                child: Text('显示底部菜单列表'),
                onPressed: () async {
                  int type = await showModalBottomSheetDiglog(context);
                  print(type);
                },
              ),
              Builder(builder: (context) {
                return RaisedButton(
                  child: Text('显示底部菜单列表，全屏'),
                  onPressed: () => showBottomSheetController(context),
                );
              },),
              RaisedButton(
                child: Text('Loading框'),
                onPressed: () => showLoadingDialog(context),
              ),
              RaisedButton(
                child: Text('自定义Loading框大小'),
                onPressed: () => showCustomLoadingDialog(context),
              ),
              RaisedButton(
                child: Text('日历Dialog'),
                onPressed: () => showDatePickerDialog(context),
              ),
              RaisedButton(
                child: Text('iOS风格日历Dialog'),
                onPressed: () => showCupertinoDatePickerDialog(context),
              ),
            ],
          ),
        )
      )
    );
  }
}