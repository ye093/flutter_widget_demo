import 'package:flutter/material.dart';
import 'dart:math';

/// 手动控制动画
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手动控制动画'),
      ),
      body: Center(child: PageContent()),
    );
  }
}

class RotateArrow extends AnimatedWidget {
  RotateArrow({Key key, this.angle}) : super(key: key, listenable: angle);
  final Animation<double> angle;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: angle.value * pi / 180,
        child: Icon(
          Icons.arrow_drop_up,
          size: 30,
          color: Colors.blue,
        ));
  }
}

class PageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageContentState();
  }
}

class _PageContentState extends State<PageContent>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      value: 0,
        vsync: this,
        duration: Duration(milliseconds: 200),
        lowerBound: -double.infinity,
        upperBound: double.infinity);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RotateArrow(
          angle: _animationController,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[Colors.orange, Colors.blueAccent])),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.purpleAccent,
              onTap: () {
                _animationController.animateTo(_animationController.value + 45,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.elasticOut);
              },
              child: SizedBox(
                  width: 120,
                  height: 35,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('转起来', style: TextStyle(color: Colors.white),),
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
