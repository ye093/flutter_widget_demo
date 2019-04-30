import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding控件测试'),
      ),
      body: Container(
        height: 180,
        color: Colors.lightGreen.withOpacity(.8),
        alignment: AlignmentDirectional.center,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              onTap: () => {},
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '尽可能小的',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationStyle: TextDecorationStyle.dashed),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
