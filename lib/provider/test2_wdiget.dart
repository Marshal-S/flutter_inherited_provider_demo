import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'global_notifier.dart';

class Test2Widget extends StatelessWidget {
  const Test2Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //推荐下面这么用，文档推荐，这么使用一定没错
    //使用watch可以正常接收到更新的消息
    final global = context.watch<GlobalNotifier>();
    //如果监听依赖的可能会不存在，那么可以使用 ?
    // final global = context.watch<GlobalNotifier?>();
    // 使用read无法监听到更新的最新通知，但使用其更新数据，其他watch的地方仍然可以接收更改通知
    // final global = context.read<GlabalNotifier>();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("测试内容2(watch)：${global.user?.username}"),
              Text("测试内容2(read)：${context.read<GlobalNotifier>().user?.username}"),
            ],
          ),
          TextButton(
            onPressed: () {
              final user = global.user;
              if (user != null) {
                user.username = "test2";
              }
              global.user = user;
            },
            child: const Text("更新"),
          ),
        ],
      ),
    );
  }
}
