import 'package:flutter/material.dart';

import 'component/font_widget.dart';

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


