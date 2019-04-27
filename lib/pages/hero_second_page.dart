import 'package:flutter/material.dart';

/// Hero 动画展示第二页
class HeroSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero详情页'),
      ),
      body: Container(
        color: Colors.cyan,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Hero(
                tag: 'boluo',
                child: Image.network(
                  'https://pzfresherp.oss-cn-shenzhen.aliyuncs.com/mall/ad/1553851248889.jpg',
                )),
          ],
        ),
      ),
    );
  }
}
