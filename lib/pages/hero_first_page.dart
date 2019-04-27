import 'package:flutter/material.dart';
import '../util/log.dart';

import 'hero_second_page.dart';

/// Hero动画测试,第一页
class HeroFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero动画'),
      ),
      body: Center(
        child: RawMaterialButton(
          fillColor: Colors.transparent,
          splashColor: Colors.cyan,
          shape: CircleBorder(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          onPressed: () {
            log('你点击了');
            Navigator.push(context, PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
                  return new FadeTransition(
                    opacity: animation,
                    child: HeroSecondPage(),
                  );
                })
            );
          },
          child: Hero(
            tag: 'boluo',
            child: ClipOval(
              child: Image.network(
                'https://pzfresherp.oss-cn-shenzhen.aliyuncs.com/mall/ad/1553851248889.jpg',
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
