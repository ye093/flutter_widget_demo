import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      alignment: AlignmentDirectional.center,
      child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.blueAccent),
          child: Text('你好', style: TextStyle(color: Colors.white),)),
    );
  }

}


class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('重新认识一下Container!'),
      ),
      body: ContainerWidget(),
    );
  }

}