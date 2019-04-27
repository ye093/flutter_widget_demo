import 'package:flutter/material.dart';

class DragTest extends StatefulWidget {
  final String title;

  DragTest({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DragState();
  }
}

class _DragState extends State<DragTest> with SingleTickerProviderStateMixin {

  double _top = 100;
  double _left = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onPanDown: (event) => print('onPanDown ${event.globalPosition}'),
              onPanUpdate: (event) => setState(() {
                print('onPanUpdate ${event.delta}, top = $_top, left = $_left');
                _left += event?.delta?.dx; // 只能在水平方向移动
//                _top += event?.delta?.dy;
              }),
              onPanEnd: (event) => print(event.velocity),
              child: CircleAvatar(
                child: Text('A'),
              )
            ),
          ),
        ],
      ),
    );
  }
}
