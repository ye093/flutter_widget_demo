import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 200,
      ),
      padding: const EdgeInsets.all(8.0),
      color: Colors.teal.shade700,
      alignment: Alignment.center,
      child: Text('加载中', style: TextStyle(color: Colors.white)),
      foregroundDecoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://pzfresherp.oss-cn-shenzhen.aliyuncs.com/mall/ad/1555921904375.jpg'),
          centerSlice: Rect.fromLTRB(0, 50, 1880, 160),
          repeat: ImageRepeat.noRepeat
        ),
      ),
      transform: Matrix4.rotationZ(0.1),
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