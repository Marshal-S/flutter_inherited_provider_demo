import 'package:flutter/material.dart';
import 'my_inherited_widget.dart';

class InheritedTestWidget extends StatefulWidget {
  const InheritedTestWidget({Key? key}) : super(key: key);

  @override
  State<InheritedTestWidget> createState() => _InheritedTestWidgetState();
}

class _InheritedTestWidgetState extends State<InheritedTestWidget> {
  String userName = '默认userName';

  @override
  Widget build(BuildContext context) {
    //就像这样一样，外面嵌套一个 StatefulWidget 就可以随便修改 InheritedWidget 属性，从而触发属性更新，再应用到指定地方
    return MyInheritedWidget(
      username: userName,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('InheritedTestWidget'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TestWidget(),
              const TestFullWidget(),
              IconButton(
                onPressed: () {
                  setState(() {
                    userName = '分享了';
                  });
                },
                icon: const Icon(
                  Icons.share,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    userName = '邮件了';
                  });
                },
                icon: const Icon(
                  Icons.mail,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(MyInheritedWidget.of(context).username, textAlign: TextAlign.center,);
  }
}

class TestFullWidget extends StatefulWidget {
  const TestFullWidget({Key? key}) : super(key: key);

  @override
  State<TestFullWidget> createState() => _TestFullWidgetState();
}

class _TestFullWidgetState extends State<TestFullWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Text(MyInheritedWidget.of(context).username, textAlign: TextAlign.center);
  }
}