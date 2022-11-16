import 'package:flutter/material.dart';

//继承自 ProxyWidget、Widget 无状态，如果有状态外面套一个 StatefulWidget就可以动态动态修改内容了😂
//假设我们仅仅用于个人页面
class MyInheritedWidget extends InheritedWidget {
  final String username;

   const MyInheritedWidget({
    Key? key,
    required this.username,
    required Widget child,
  }) : super(key: key, child: child);

  //就像 Navigator.of(context)一样获取，用于调用内部参数
   static MyInheritedWidget of(BuildContext context) {
    final MyInheritedWidget? result = context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
    assert(result != null, 'No MyInherited found in context');
    return result!;
  }

  //更新时用于判断、过滤是否通知外部更新
  //如果外部使用的是 StatefulWidget，变更时会调用didChangeDependencies，以此来通知对应页面进行其他调整
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    //返回为true就是通知更新，否则不更新
    //这里我们过滤一下，如果值没发生改变，我们就不通知外面即可
    return username != oldWidget.username;
  }
}
