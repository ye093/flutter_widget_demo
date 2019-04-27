import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'second_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: RawMaterialButton(
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                return SecondPage();
              }
          ));
        },
        fillColor: Colors.lightBlue,
        splashColor: Colors.lightBlueAccent,
        child: Text(
          '跳转',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
