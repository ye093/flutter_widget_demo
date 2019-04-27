import 'package:flutter/material.dart';

/// 手指触控事件
class MyPointerTouch extends StatefulWidget {
  MyPointerTouch({Key key, @required String title})
      : _title = title,
        super(key: key);

  final String _title;

  @override
  State<StatefulWidget> createState() {
    return _MyPointerTouchState();
  }
}

class _MyPointerTouchState extends State<MyPointerTouch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange
          ),
          child: Listener(
            behavior: HitTestBehavior.opaque, // 不加这个只能作用在Text的区域上 ConstrainedBox指定的区域无法捕抓
            onPointerDown: (event) {
              print('onPointerDown ${event.position}');
            },
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300, 200)),
              child: Center(
                child: Text(
                  '叶金耘',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
