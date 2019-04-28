import 'package:flutter/material.dart';
import 'dart:math';

/// 利用AnimatedBuilder
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('利用AnimatedBuilder'),
      ),
      body: Center(child: MyAnimatedBuilder()),
    );
  }
}

class MyAnimatedBuilder extends StatefulWidget {
  @override
  _MyAnimatedBuilder createState() {
    return _MyAnimatedBuilder();
  }
}

class _MyAnimatedBuilder extends State<MyAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation<Color> _colorAnimation;
  Animation<double> _angleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          });
    _colorAnimation =
        ColorTween(begin: Colors.lightBlueAccent, end: Colors.orange)
            .animate(_animationController);
    _angleAnimation =
        Tween<double>(begin: 0, end: 360).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, _) {
        return ValueListenableBuilder<double>(
          valueListenable: _angleAnimation,
          builder: (context, angle, child) {
            return Transform.rotate(
              angle: angle * pi / 180,
              child: child,
            );
          },
          child: ValueListenableBuilder<Color>(
            valueListenable: _colorAnimation,
            builder: (context, color, _) {
              return Icon(
                Icons.explore,
                size: 80,
                color: color,
              );
            },
          ),
        );
      },
    );
  }
}
