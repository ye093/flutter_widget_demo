import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align控件测试'),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.yellowAccent,
          child: Align(
            // FractionalOffset 范围 0 - 1百分比偏移
            alignment: FractionalOffset(.1, .2),
            child: Container(
              width: 40,
              height: 40,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

}