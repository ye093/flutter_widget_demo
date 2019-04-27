import 'package:flutter/material.dart';

/// SizedBox, 可以精确控制控件的大小及动态改变多个属性
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SizedBox控件测试'),
      ),
      body: PageContent(),
    );
  }
}

class PageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageContentState();
  }
}

class _PageContentState extends State<PageContent> {
  ValueNotifier<Size> _size = ValueNotifier(Size(45, 20));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ValueListenableBuilder<Size>(
            valueListenable: _size,
            builder: (BuildContext context, Size size, _) {
              return MyScaleWidget(size: size);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 50,
            height: 35,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: const <Color>[
              Colors.blue,
              Colors.lightBlueAccent
            ])),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.yellow,
                onTap: () {
                  _size.value += Offset(5, 10);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    '放大',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// 大小可以变的控件
class MyScaleWidget extends StatefulWidget {
  MyScaleWidget({Key key, @required this.size}) : super(key: key);

  final Size size;

  @override
  State<StatefulWidget> createState() {
    return _MyScaleWidgetState();
  }
}

class _MyScaleWidgetState extends State<MyScaleWidget>
    with TickerProviderStateMixin {
  AnimationController _widthController;
  AnimationController _heightController;

  @override
  void initState() {
    _widthController = AnimationController(
        value: widget.size.width,
        vsync: this,
        lowerBound: -double.infinity,
        upperBound: double.infinity);
    _heightController = AnimationController(
        value: widget.size.height,
        vsync: this,
        lowerBound: -double.infinity,
        upperBound: double.infinity);
    super.initState();
  }

  @override
  void didUpdateWidget(MyScaleWidget oldWidget) {
    if (oldWidget.size.width != widget.size.width) {
      _widthController.animateTo(widget.size.width,
          duration: Duration(milliseconds: 300), curve: Curves.elasticOut);
    }
    if (oldWidget.size.height != widget.size.height) {
      _heightController.animateTo(widget.size.height,
          duration: Duration(milliseconds: 300), curve: Curves.elasticOut);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: _heightController,
      builder: (BuildContext context, double height, Widget child) {
        return SizedBox(
          height: height,
          child: child,
        );
      },
      child: ValueListenableBuilder<double>(
          valueListenable: _widthController,
          builder: (BuildContext context, double width, Widget child) {
            return SizedBox(
              width: width,
              child: child,
            );
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: const <Color>[Colors.blueAccent, Colors.blue])),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hello',
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )),
    );
  }
}
