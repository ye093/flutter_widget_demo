//import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'pages/cupertino_tab_scaffold.dart';

void main() => runApp(App());

/// 安卓风格的
//class App extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: '主题测试',
//      home: MyPage(),
//      theme: ThemeData(
//        primarySwatch: Colors.green,
//        accentColor: Colors.lightGreenAccent,
//        backgroundColor: Colors.black12,
//        fontFamily: 'PuHuiTi',
//        textTheme: TextTheme(
//          body1: TextStyle(
//            color: Colors.black,
//            fontSize: 16
//          )
//        )
//      ),
//    );
//  }
//
//}

/// 苹果风格的
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: '苹果主题风格',
      home: MyPage(),
      theme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(fontFamily: "PuHuiTi"),
            actionTextStyle: TextStyle(fontFamily: "PuHuiTi"),
            navActionTextStyle: TextStyle(fontFamily: "PuHuiTi"),
          ),
          primaryColor: CupertinoColors.activeBlue,
          primaryContrastingColor: CupertinoColors.activeGreen),
    );
  }
}
