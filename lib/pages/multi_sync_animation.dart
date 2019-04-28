import 'package:flutter/material.dart';

/// 多属性同步动画
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('多方同步动画'),
      ),
      body: Center(child: TestWidget()),
    );
  }
}

/// 可控制多方属性
class MultiAnimatedWidget extends AnimatedWidget {
  MultiAnimatedWidget({Key key, @required this.animation})
      : super(key: key, listenable: animation);

  final Animation<double> animation;

  final _sizeTween =
      SizeTween(begin: const Size(20, 40), end: const Size(30, 60));
  final _opacityTween = Tween<double>(begin: .1, end: 1);

  @override
  Widget build(BuildContext context) {
    Size size = _sizeTween.evaluate(animation);

    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.purpleAccent,
        ),
      ),
    );
  }
}

class TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<TestWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn)
        ..addStatusListener((status) {
          if (status == AnimationStatus.dismissed) {
            _animationController.forward();
          } else if (status == AnimationStatus.completed) {
            _animationController.reverse();
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
    return MultiAnimatedWidget(animation: _animation);
  }
}
