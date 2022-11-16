import 'package:flutter/material.dart';
import 'package:flutter_inherited_provider_demo/provider/global2_notifier.dart';
import 'package:flutter_inherited_provider_demo/provider/global_notifier.dart';
import 'package:flutter_inherited_provider_demo/provider/test1_widget.dart';
import 'package:flutter_inherited_provider_demo/provider/test2_wdiget.dart';
import 'package:flutter_inherited_provider_demo/provider/test3_widget.dart';
import 'package:flutter_inherited_provider_demo/provider/test4_widget.dart';
import 'package:provider/provider.dart';

class ProviderTestWidget extends StatefulWidget {
  const ProviderTestWidget({Key? key}) : super(key: key);

  @override
  State<ProviderTestWidget> createState() => _ProviderTestWidgetState();
}

class _ProviderTestWidgetState extends State<ProviderTestWidget> {
  final companyNotifier = GlobalNotifier();

  //我们设置一个Provider
  Widget localProvider({required Widget child}) {
    //内外同时使用 同一个类型 value 时，会获取离得最近的 Provider 提供的内容
    //不想使用前面的 provider 的话，可以直接返回child试试效果，相信马上会理解
    //前面main里面也是这个global类型，这里也是，会获取到最近的局部 value
    // return ChangeNotifierProvider(create: (_) => GlobalNotifier(), child: child);
    //如果value由外部传入更新，最好使用 ChangeNotifierProvider.value 形式
    //这样内外会使用同一个 value，更新时会得到同样的效果
    // return ChangeNotifierProvider.value(
    //   value: companyNotifier,
    //   child: child,
    // );
    return child; //可以直接返回一个 child 测试一下没有局部 Provider 效果
  }

  //从上面也可以看出，我们引用中可能使用了多个 provider，提供多个数据
  //如果全局数据比较多的话，可能会存在这种情况
  test1() {
    return ChangeNotifierProvider(
      create: (_) => GlobalNotifier2(),
      child: ChangeNotifierProvider(
        create: (_) => GlobalNotifier2(),
        child: ChangeNotifierProvider(
          create: (_) => GlobalNotifier2(),
          child: const Text(''),
        ),
      ),
    );
  }

  //通过数组代替嵌套，结果是一样的，是不是看着稍微舒服点了😂
  test2() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GlobalNotifier2(),
        ),
        ChangeNotifierProvider(
          create: (_) => GlobalNotifier2(),
        ),
        ChangeNotifierProvider(
          create: (_) => GlobalNotifier2(),
        ),
      ],
      child: const Text(''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return localProvider(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("测试Provider"),
        ),
        body: ListView(
          children: const [Test1Widget(), Test2Widget(), Test3Widget(), Test4Widget()],
        ),
      ),
    );
  }
}
