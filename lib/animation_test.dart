import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget {
  final String title;

  AnimationTest({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimationTestState();
  }
}

class _AnimationTestState extends State<AnimationTest>
    with SingleTickerProviderStateMixin {
  // AnimationController 用于控制动画,动画启动 forward, stop, reverse
  Animation<double> animation;
  AnimationController controller;

  double picWidth = 300, picHeight = 150;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    // 图片宽高由0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          picWidth = animation.value;
          picHeight = animation.value;
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('简单的动画测试'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.network(
            'https://pzfresherp.oss-cn-shenzhen.aliyuncs.com/mall/ad/1555308985335.jpg',
            width: picWidth,
            height: picHeight,
          ),
          FlatButton(
            onPressed: () => controller.forward(from: 0),
            child: Text('执行动画'),
          )
        ],
      ),
    );
  }
}
