import 'package:flutter/material.dart';

/// 交错动画展示
class CrossAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('交错动画'),
      ),
      body: CrossAnimationWidget(),
    );
  }
}

class CrossAnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CrossAnimationWidgetState();
  }
}

class _CrossAnimationWidgetState extends State<CrossAnimationWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> _heightAnimation;
  Animation<Color> _colorAnimation;
  Animation<double> _positionAnimation;

  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _heightAnimation = Tween(begin: 30.0, end: 300.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(.0, .6, curve: Curves.ease)));
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.amber).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(.0, .6, curve: Curves.ease)));
    _positionAnimation = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(.6, 1.0, curve: Curves.ease)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RawMaterialButton(
          onPressed: () => _animationController.forward(from: 0.0),
          fillColor: Colors.blue,
          splashColor: Colors.lightBlueAccent,
          child: Text('启动'),
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext ctx, Widget child) {
            return Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(left: _positionAnimation.value),
              child: Container(
                color: _colorAnimation.value,
                width: 50.0,
                height: _heightAnimation.value,
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
}
