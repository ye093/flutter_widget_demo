import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画综合测试'),
      ),
      body: MyAnimationWidget(),
    );
  }
}

/// 例1，全手工动画
class MyAnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAnimationWidgetState();
  }
}

/// 全手工动画状态
class _MyAnimationWidgetState extends State<MyAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  // 大小-》单边
  Animation<double> _sideScale;

  // 大小-》Size
  Animation<Size> _sizeScale;

  // 颜色
  Animation<Color> _colorChange;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
            ..addStatusListener((status) {
              if (status == AnimationStatus.dismissed) {
                _animationController.forward();
              } else if (status == AnimationStatus.completed) {
                _animationController.reverse();
              }
            });

    _sideScale =
        Tween<double>(begin: 30, end: 90).animate(_animationController)
            ..addListener(() => setState((){
              _firstWidth = _sideScale.value;
            }));

    _sizeScale = SizeTween(begin: Size(30, 30), end: Size(50, 50))
        .animate(_animationController)
        ..addListener(() => setState(() => {
          _secondSize = _sizeScale.value
        }));

    _colorChange = ColorTween(begin: Colors.deepOrange, end: Colors.amber)
        .animate(_animationController)
        ..addListener(() => setState(() => _thirdColor = _colorChange.value));

    _animationController.forward();

  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  double _firstWidth = 30;
  Size _secondSize = Size(30, 30);
  Color _thirdColor = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[


        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: _thirdColor,
              border: Border.all(color: Colors.yellow, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
        ),

        SizedBox(
          height: 10,
        ),

        Container(
          width: _firstWidth,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.yellow, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
        ),

        SizedBox(
          height: 10,
        ),

        Container(
          width: _secondSize.width,
          height: _secondSize.height,
          decoration: BoxDecoration(
              color: Colors.purpleAccent,
              border: Border.all(color: Colors.yellow, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
        ),

      ],
    );
  }
}
