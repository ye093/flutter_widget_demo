import 'package:flutter/material.dart';

/// Center 是一个尽可能大的控件
class MyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center是一个尽可能大的控件'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: Colors.yellow.withOpacity(.3)
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.cyanAccent,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                onTap: () => {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('这是一个文本',
                    style: TextStyle(
                      background: Paint()..color = Colors.deepOrangeAccent.withOpacity(.3),
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red,
                      decorationStyle: TextDecorationStyle.solid
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

