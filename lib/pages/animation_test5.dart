import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('混合动画测试'),
      ),
      body: MixinAnimationWidget(),
    );
  }
}

class MixinAnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MixinAnimationWidgetState();
  }
}

class _MixinAnimationWidgetState extends State<MixinAnimationWidget>
    with SingleTickerProviderStateMixin {
  // 放大动画
  Animation<Size> _scaleAnimation;

  // 向上位移动画
  Animation<double> _floatAnimation;

  // 动画按制器
  AnimationController _animationController;

  @override
  void initState() {
    // 初始位置
    double startY = 400;
    double endY = 90;

    _animationController ??=
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    final scale = CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.2, curve: Curves.easeInToLinear));
    final move = CurvedAnimation(
        parent: _animationController,
        curve: Interval(.2, 1, curve: Curves.easeIn));
    _scaleAnimation =
        Tween<Size>(begin: Size(0, 0), end: Size(300.0, 150.0)).animate(scale);
    _floatAnimation = Tween<double>(begin: startY, end: endY).animate(move);

    _animationController?.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      } else if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
    super.initState();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext ctx, Widget child) {
        return Center(
          child: Container(
            margin: EdgeInsets.only(top: _floatAnimation.value),
            width: _scaleAnimation.value.width,
            height: _scaleAnimation.value.height,
            child: child,
          ),
        );
      },
      child: Image.asset('images/pz_boluo.jpg', fit: BoxFit.cover,),
    );
  }
}
