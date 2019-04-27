import 'package:flutter/material.dart';

/// 动画测试利用AnimatedBuilder
/// by yejy
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('利用AnimatedBuilder创建动画'),
      ),
      body: Center(child: MyAnimationWidget()),
    );
  }
}

class MyAnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAnimationWidgetState();
  }

}

class _MyAnimationWidgetState extends State<MyAnimationWidget> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _animationController ??= AnimationController(vsync: this, duration: Duration(seconds: 2));

    CurvedAnimation curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOutExpo);

    _animation = Tween<double>(begin: 0, end: 300).animate(curvedAnimation)
        ..addStatusListener((status) {
          if (status == AnimationStatus.dismissed) {
            _animationController.forward();
          } else if (status == AnimationStatus.completed) {
            _animationController.reverse();
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext ctx, Widget child) {
        return Container(
          width: _animation.value,
          height: 80,
          child: child,
        );
      },
      child: Image.asset('images/pz_boluo.jpg', fit: BoxFit.cover,),
    );
  }


}



