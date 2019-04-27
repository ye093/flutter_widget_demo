import 'package:flutter/material.dart';

import 'pages/value_listenable_builder.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自定义控件',
      home: MyPage(),
    );
  }

}


