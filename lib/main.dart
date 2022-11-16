import 'package:flutter/material.dart';
import 'package:flutter_inherited_provider_demo/provider/global_notifier.dart';
import 'package:flutter_inherited_provider_demo/provider/provider_test_widget.dart';
import 'package:provider/provider.dart';
import 'inherited/inherited_test_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //这个 Provider 无法监听改动，作为只读使用，且有其他操作会直接爆红，尤其在局部时，不推荐使用
    // return Provider(
    //这个可以监听内容更新
    return ChangeNotifierProvider(
      create: (_) {
        return GlobalNotifier();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userName = '默认userName';
  final no = ValueNotifier<String>;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const InheritedTestWidget()));
                },
                child: const Text("点击测试 inherited"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProviderTestWidget()));
                },
                child: const Text("点击测试 provider"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
