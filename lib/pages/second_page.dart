import 'package:flutter/material.dart';
import '../util/log.dart';

/// 第二个页面
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二页'),
      ),
      body: ScaleImageWidget(),
    );
  }
}

/// 定义动画,定义一个通用的动画控件
class GeneralAnimationWidget extends StatelessWidget {
  GeneralAnimationWidget(
      {Key key, @required this.animation, @required this.child})
      : super(key: key);

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (BuildContext ctx, Widget child) {
        return SizedBox(
          width: animation.value,
          height: animation.value,
          child: child,
        );
      },
    );
  }
}

/// 定义一个包含动画组件的widget
class ScaleImageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleImageWidgetState();
  }
}

class _ScaleImageWidgetState extends State<ScaleImageWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController ??=
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation ??= Tween(begin: 10.0, end: 350.0).animate(_animationController);

    _animationController?.addStatusListener((AnimationStatus status) {
      switch(status) {
        case AnimationStatus.dismissed:
          log('动画停止');
          break;
        case AnimationStatus.forward:
          log('动画开始');
          break;
        case AnimationStatus.completed:
          log('动画完成');
          break;
        default:
          log('动画反转');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        GeneralAnimationWidget(
          animation: _animation,
          child: Image.network(
              'https://pzfresherp.oss-cn-shenzhen.aliyuncs.com/mall/ad/1553850944362.jpg'),
        ),
        RawMaterialButton(
          fillColor: Colors.lightBlue,
          splashColor: Colors.lightBlueAccent,
          onPressed: () => _animationController?.forward(from: 0.0),
          child: Text('动画发动'),
        )
      ],
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
}
