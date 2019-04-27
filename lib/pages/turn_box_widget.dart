import 'package:flutter/material.dart';

import '../util/log.dart';

/// 自定义控件之旋转控件
class TurnBox extends StatefulWidget {
  TurnBox(
      {Key key,
      @required this.turns,
      @required this.speed,
      @required this.child})
      : super(key: key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return _TurnBoxState();
  }
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        value: widget.turns,
        vsync: this,
        duration: Duration(milliseconds: widget.speed),
        lowerBound: -double.infinity,
        upperBound: double.infinity);


    log('initState');
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    log('didUpdateWidget');


    if (oldWidget.turns != widget.turns) {
      _animationController.animateTo(widget.turns,
          duration: Duration(milliseconds: widget.speed),
          curve: Curves.elasticOut);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(turns: _animationController, child: widget.child);
  }
}

class TurnBoxTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TurnBoxTestState();
  }
}

class _TurnBoxTestState extends State<TurnBoxTest> {
  // 0 -> 1
  double _turns = .0;
  int _speed = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义控件测试'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TurnBox(
            turns: _turns,
            speed: _speed,
            child: Icon(
              Icons.access_time,
              color: Colors.red,
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: const <Color>[Colors.orange, Colors.deepOrange]),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.red,
                onTap: () {
                  setState(() {
                    _turns += .25;
                    _speed += 100;
                  });

                },
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 180.0, height: 30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      '旋转',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
