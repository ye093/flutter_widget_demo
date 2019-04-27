import 'package:flutter/material.dart';
import 'dart:math';

/// valueListenableBuilder
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueListenableBuilder'),
      ),
      body: ValueListenableAnimationPageContent(),
    );
  }
}

/// 测试ValueListenableBuilder, 例1
class MyValueListenableBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ValueListenableBuilderState();
  }
}

class _ValueListenableBuilderState extends State<MyValueListenableBuilder> {
  ValueNotifier<int> count = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ValueListenableBuilder<int>(
            valueListenable: count,
            builder: (BuildContext context, int value, _) {
              return Text('value = $value');
            }),
        RaisedButton(
          color: Colors.blueAccent,
          splashColor: Colors.lightBlue,
          onPressed: () => count.value++,
          child: Text(
            '递增',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

/// 配合动画测试, 例2
///
/// 测试页面
class ValueListenableAnimationPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ValueListenableAnimationPageContentState();
  }
}

class _ValueListenableAnimationPageContentState
    extends State<ValueListenableAnimationPageContent> {
  ValueNotifier<double> _angle = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ValueListenableBuilder<double>(
          valueListenable: _angle,
          builder: (BuildContext context, double value, _) {
            return ValueListenableWithAnimation(angle: value);
          },
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: const <Color>[
              Colors.blueAccent,
              Colors.black38,
              Colors.lightBlueAccent
            ]),
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.lightBlueAccent,
              onTap: () {
                _angle.value += 90;
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '转起来吧',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

/// 带旋转动画效果的控件
class ValueListenableWithAnimation extends StatefulWidget {
  ValueListenableWithAnimation({Key key, @required this.angle})
      : super(key: key);

  final double angle;

  @override
  State<StatefulWidget> createState() {
    return _ValueListenableAnimationState();
  }
}

class _ValueListenableAnimationState extends State<ValueListenableWithAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        value: widget.angle,
        vsync: this,
        duration: Duration(milliseconds: 200),
        lowerBound: -double.infinity,
        upperBound: double.infinity);
    super.initState();
  }

  @override
  void didUpdateWidget(ValueListenableWithAnimation oldWidget) {
    if (oldWidget.angle != widget.angle) {
      _animationController.animateTo(widget.angle,
          duration: Duration(milliseconds: 300), curve: Curves.elasticOut);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: _animationController,
        builder: (BuildContext context, double value, Widget child) {
          return Transform.rotate(
            angle: value / 360 * 2 * pi,
            child: child,
          );
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.purpleAccent,
        ));
  }
}
