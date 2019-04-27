import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero动画'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              decoration:
                  ShapeDecoration(shape: CircleBorder(), color: Colors.black38),
              child: Hero(
                tag: 'head',
                child: ClipOval(
                    child: Image.asset(
                  'images/pz_boluo.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )),
              ),
            ),
            RawMaterialButton(
                fillColor: Colors.blue,
                splashColor: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.push(context, PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {

                      return FadeTransition(
                          opacity: animation,
                          child: MySecondPage());
                    }
                  ));
                },
                child: Text('跳转'))
          ],
        ),
      ),
    );
  }
}


class MySecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二页'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Hero(
              tag: "head",
              child: Image.asset('images/pz_boluo.jpg', width: double.infinity, height: 100.0,))
        ],
      ),
    );
  }

}
