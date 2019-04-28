import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('字体测试'),
      ),
      body: Column(
        children: const <Widget>[
          Text(
            '你好啊这里是阿里字体',
            style: TextStyle(fontFamily: 'PuHuiTi', fontSize: 22,),
          ),
          Text(
            '阿里字体加粗',
            style: TextStyle(fontFamily: 'PuHuiTi', fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '你好啊这里是普通字体',
            style: TextStyle(fontSize: 22),
          ),
          Text(
            '正常字体加粗',
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
