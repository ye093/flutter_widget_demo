import 'package:flutter/material.dart';

/// 手势识别
class GestureDetectorTest extends StatefulWidget {
  final String title;

  GestureDetectorTest({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GestureDetectorState();
  }
}

class _GestureDetectorState extends State<GestureDetectorTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: GestureDetector(
        onDoubleTap: () => print('你双击了'),
        onLongPress: () => print('你长按了'),
        child: RawMaterialButton(
          fillColor: Colors.cyan,
          splashColor: Colors.lightBlueAccent,
          onPressed: () => null,
          child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(250, 250)),
              child: Center(
                child: Text(
                  'Button',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ),
      )),
    );
  }
}
