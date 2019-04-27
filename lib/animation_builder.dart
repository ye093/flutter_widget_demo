import 'package:flutter/material.dart';


class ScaleAnimationRoute extends StatefulWidget {


  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);

    var eventBus = EventBus();
    eventBus.setListener(startAnimation);
  }

  startAnimation() {
    controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: Image.network('https://pzfresherp.oss-cn-shenzhen.aliyuncs.com/mall/ad/1555922103450.jpg'),
      builder: (BuildContext ctx, Widget child) {
        return new Center(
          child: Container(
            width: animation.value,
            height: animation.value,
            child: child,
          ),
        );
      },
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class EventBus {
  EventBus._internal();
  static var eventBus = EventBus._internal();

  factory EventBus() => eventBus;

  VoidCallback callback;

  setListener(VoidCallback f) {
    callback = f;
  }

  emit() {
    if (callback != null) callback();
  }
}