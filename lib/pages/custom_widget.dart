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
          GradientButtonRoute()
        ],
      ),
    );
  }

}



class GradientButton extends StatelessWidget {
  GradientButton(
      {this.colors, this.width, this.height, this.onTap, @required this.child});

  final List<Color> colors;

  final double width;
  final double height;

  final Widget child;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    List<Color> _colors = colors ?? <Color>[
      themeData.primaryColor,
      themeData.primaryColorDark ?? themeData.primaryColor
    ];
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors)
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: colors.last,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: width, height: height),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class GradientButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GradientButton(
          colors: const <Color>[
            Colors.blue,
            Colors.red
          ],
          width: double.infinity,
          height: 50.0,
          onTap: () => print('你好我点击了'),
          child: Text('这是一个自定义的按钮'),
        )
      ],
    );
  }

}
