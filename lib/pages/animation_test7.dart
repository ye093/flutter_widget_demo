import 'package:flutter/material.dart';
import 'dart:math';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('扩展AnimatedWidget'),
      ),
      body: MyAnimatedWidgetContent(),
    );
  }
}

/// 扩展AnimationWidget
/// 继承AnimatedWidget 不用写 setState
class MyAnimatedWidget extends AnimatedWidget {
  MyAnimatedWidget({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: listenable,
      builder: (BuildContext context, double value, Widget child) {
        return Transform.rotate(
          angle: value == null ? 0 : (value * pi / 180),
          child: child,
        );
      },
      child: Icon(
        Icons.access_time,
        size: 56,
        color: Colors.tealAccent,
      ),
    );
  }
}

class MyAnimatedWidgetContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAnimatedWidgetContentState();
  }
}

class _MyAnimatedWidgetContentState extends State<MyAnimatedWidgetContent>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _angleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    var curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _angleAnimation = Tween<double>(begin: 0, end: 360).animate(curvedAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.forward(from: 0);
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward(from: 0);
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyAnimatedWidget(
        animation: _angleAnimation,
      ),
    );
  }
}
