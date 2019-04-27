import 'package:flutter/material.dart';

/// 放大缩小控件
class ScaleGesture extends StatefulWidget {
  ScaleGesture({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ScaleGestureState();
  }
}

class _ScaleGestureState extends State<ScaleGesture> {
  double _picWidth;

  @override
  Widget build(BuildContext context) {
    //获取屏幕的宽度
    double defaultWidth = MediaQuery.of(context).size.width;
    _picWidth ??= defaultWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onScaleUpdate: (event) {
          setState(() {
            _picWidth = defaultWidth * event.scale.clamp(.1, 20);
          });
        },
        child: Center(
            child: Image.network(
          'https://pzfresherp.oss-cn-shenzhen.aliyuncs.com/mall/ad/1555921904375.jpg',
          width: _picWidth,
        )),
      ),
    );
  }
}
