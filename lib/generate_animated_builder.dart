import 'package:flutter/material.dart';

/// 定义一个通用的动画类
class MyAnimationWidget extends StatefulWidget {
  MyAnimationWidget({Key key, @required this.child, @required this.animation})
      : super(key: key);

  /// 定义两个属性 1、child 2 animation
  final Widget child;
  final Animation animation;

  @override
  State<StatefulWidget> createState() {
    return _MyAnimationWidgetState(child: child, animation: animation);
  }
}

class _MyAnimationWidgetState extends State<MyAnimationWidget> {
  _MyAnimationWidgetState({@required this.child, @required this.animation});

  /// 定义两个属性 1、child 2 animation
  final Widget child;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (BuildContext ctx, Widget child) {
        return ConstrainedBox(
            constraints: BoxConstraints.tight(Size(animation.value, animation.value)), child: child);
      },
    );
  }
}

/// 页面
class MyPage extends StatefulWidget {
  MyPage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));
//    _animation = new Tween(begin: 0.0, end: 200.0).animate(_controller);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          MyAnimationWidget(
              child: Image.asset(
                'images/car.png',
              ),
              animation: _animation),
          RawMaterialButton(
            fillColor: Colors.blue,
            splashColor: Colors.lightBlueAccent,
            onPressed: () {
              _controller.forward(from: 0);
              print('你点击了');
            },
            child: Text('点击我'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
