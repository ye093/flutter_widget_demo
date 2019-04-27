import 'package:flutter/material.dart';

import '../util/log.dart';

/// 继承自 AnimatedWidget
class SubAnimatedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('继承类AnimatedWidget动画'),
      ),
      body: Center(
        child: MyPage(),
      ),
    );
  }
}

class MyAnimatedWidget extends AnimatedWidget {
  MyAnimatedWidget({Key key, @required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      width: animation.value,
      height: 80,
      child: Image.asset(
        'images/pz_boluo.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _sizeAnimation;

  @override
  void initState() {
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));
    CurvedAnimation curvedAnimation = new CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOut);
    _sizeAnimation = Tween<double>(begin: 30, end: 300).animate(curvedAnimation)
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.dismissed:
            _animationController.forward();
            break;
          case AnimationStatus.completed:
            _animationController.reverse();
            break;
          default:
            log(status.toString());
            break;
        }
      });
    super.initState();

    _animationController?.forward();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyAnimatedWidget(animation: _sizeAnimation);
  }
}
