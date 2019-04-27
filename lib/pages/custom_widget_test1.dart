import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义控件'),
      ),
      body: Column(
        children: <Widget>[
          CustomGradientButton()
        ],
      ),
    );
  }

}

class CustomGradientButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.green, Colors.orangeAccent]),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: Colors.purpleAccent,
          highlightColor: Colors.transparent,
          onTap: () => {},
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: double.infinity, height: 50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('这是一个自定义的按钮', style: TextStyle(
                  fontWeight: FontWeight.bold,color: Colors.white
                ),),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
