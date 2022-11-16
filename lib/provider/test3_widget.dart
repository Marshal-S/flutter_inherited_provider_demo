import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'global_notifier.dart';

class Test3Widget extends StatelessWidget {
  const Test3Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //过去其他更改，只更新对应属性，避免重新build widget
    final username = context.select((GlobalNotifier e) => e.user?.username);
    final age = context.select((GlobalNotifier e) => e.user?.age);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("测试3(单属性name)：$username"),
              TextButton(
                onPressed: () {
                  final global = context.read<GlobalNotifier>();
                  if (global.user != null) {
                    global.user!.username = "test3";
                  }
                  global.user = global.user;
                },
                child: const Text("更新"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("测试3(单属性age)：$age"),
              TextButton(
                onPressed: () {
                  final global = context.read<GlobalNotifier>();
                  if (global.user != null) {
                    global.user!.age = 20;
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
