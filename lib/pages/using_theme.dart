import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('using theme'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const <Widget>[
          Text('这里是不是可以随意写东西'),
          Text('今天我寒夜里看雪飘过'),
          Text('今天我寒夜里看雪飘过'),
          Text('今天我寒夜里看雪飘过'),
          Text('今天我寒夜里看雪飘过'),
          Text('今天我寒夜里看雪飘过'),
          Text('口啊叶吕'),
        ],
      )
    );
  }

}