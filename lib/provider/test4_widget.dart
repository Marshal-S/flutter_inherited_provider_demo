import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'global_notifier.dart';

class Test4Widget extends StatelessWidget {
  const Test4Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //默认监听变化，跟watch一样
              //context value1 child
              Consumer<GlobalNotifier>(builder: (_, global, __) {
                return Text("测试4(优化局部Consumer)：${global.user?.username}");
              }),
              //同理，最多到 Consumer2，即6个参数
              //context value1 value2 child
              // Consumer2<GlobalNotifier, GlobalNotifier2>(builder: (_, global, global2, __) {
              //   return Text("测试4(优化局部控件刷新Consumer)：${global.user?.username}");
              // }),
              TextButton(
                onPressed: () {
                  final global = context.read<GlobalNotifier>();
                  if (global.user != null) {
                    global.user!.username = "测试4";
                  }
                  global.user = global.user;
                },
                child: const Text("更新"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
