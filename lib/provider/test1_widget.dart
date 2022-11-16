import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'global_notifier.dart';

class Test1Widget extends StatelessWidget {
  const Test1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    //最原始的读取参数的方法，不推荐这么用
    final global = Provider.of<GlobalNotifier>(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("测试内容1：${global.user?.username}"),
          TextButton(
            onPressed: () {
              final user = global.user;
              if (user != null) {
                user.username = "test1";
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
