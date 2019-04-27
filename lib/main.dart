import 'package:flutter/material.dart';

import 'pages/turn_box_widget.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自定义控件',
      home: TurnBoxTest(),
    );
  }

}


