import 'package:flutter/material.dart';
import '../util/log.dart';

/// 动画测试页面
class AnimationTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Center(
        child: SimpleAnimationWidget(),
      ),
    );
  }
}

/// 创建一个通用的动画
class SimpleAnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SimpleAnimationWidgetState();
  }
}

class _SimpleAnimationWidgetState extends State<SimpleAnimationWidget>
    with SingleTickerProviderStateMixin {
  /// 其实动画有三个类 Animation AnimationController Tween
  Animation<double>
      _widthAnimation; // Animation一般为 Animation<double> 注意不能为 Animation<int>,还有其余两个 Animation<Size> 尺寸 Animation<Color>
  AnimationController _animationController;

  double _boxWidth;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: 2)); // 定义动画的行为，时长
    // Animation<double> 通过Tween和AnimationController 实例化
    _widthAnimation =
        Tween<double>(begin: 30, end: 300).animate(_animationController)
          ..addListener(() {
            setState(() {
              _boxWidth = _widthAnimation.value;
            });
          })
          ..addStatusListener((animationStatus) {
            switch (animationStatus) {
              case AnimationStatus.dismissed:
                _animationController.forward();
                break;
              case AnimationStatus.completed:
                _animationController.reverse();
                break;
              default:
                log(animationStatus.toString());
                break;
            }
          });
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _boxWidth ?? 30.0,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.teal
      ),
      child: Image.asset(
        'images/pz_boluo.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
