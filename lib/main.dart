import 'package:flutter/material.dart';

import 'pages/tab_controller_test1.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '字体测试',
      home: MyPage(),
    );
  }

}


