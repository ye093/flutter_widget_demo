import 'package:flutter/material.dart';
import '../util/log.dart';

/// PageView Widget
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageViewWidget测试'),
      ),
      body: PageViewWidget(),
    );
  }
}

// 测试PageView Widget
class PageViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageViewWidgetState();
  }
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final ValueNotifier<int> _currentPage = ValueNotifier(0);

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 页面跳转
  void _animateToPage(int index) {
    _pageController?.animateToPage(index,
        duration: Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentPage,
      builder: (BuildContext ctx, int value, _) {
        return Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  _currentPage.value = index;
                },
                children: <Widget>[
                  FirstPage(
                    key: Key('firstPage'),
                    isShow: value == 0,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('这里是第$value页'),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        onPressed: () => _animateToPage(2),
                        child: Text('点击'),
                      ),
                    ],
                  ),
                  Text('这里是第$value页'),
                  Text('这里是第$value页'),
                ],
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RawMaterialButton(
                    padding: EdgeInsets.all(5),
                    shape: CircleBorder(),
                    splashColor: Colors.cyanAccent,
                    onPressed: () {
                      if (_currentPage.value != 0) {
                        _animateToPage(0);
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 26,
                        ),
                        Text('首页', style: TextStyle(fontSize: 12, color: Colors.white),)
                      ],
                    ),
                  ),
                  RawMaterialButton(
                    padding: EdgeInsets.all(5),
                    shape: CircleBorder(),
                    splashColor: Colors.cyanAccent,
                    onPressed: () {
                      if (_currentPage.value != 1) {
                        _animateToPage(1);
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.business,
                          color: Colors.white,
                          size: 26,
                        ),
                        Text('商业', style: TextStyle(fontSize: 12, color: Colors.white),)
                      ],
                    ),
                  ),
                  RawMaterialButton(
                    padding: EdgeInsets.all(5),
                    shape: CircleBorder(),
                    splashColor: Colors.cyanAccent,
                    onPressed: () {
                      if (_currentPage.value != 2) {
                        _animateToPage(2);
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 26,
                        ),
                        Text('购物车', style: TextStyle(fontSize: 12, color: Colors.white),)
                      ],
                    ),
                  ),
                  RawMaterialButton(
                    padding: EdgeInsets.all(5),
                    shape: CircleBorder(),
                    splashColor: Colors.cyanAccent,
                    onPressed: () {
                      if (_currentPage.value != 3) {
                        _animateToPage(3);
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 26,
                        ),
                        Text('个人中心', style: TextStyle(fontSize: 12, color: Colors.white),)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

/// 第一页
class FirstPage extends StatefulWidget {
  FirstPage({Key key, @required this.isShow}) : super(key: key);

  final bool isShow;

  @override
  State<StatefulWidget> createState() {
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    log('执行了FirstPage的initState => ${widget.isShow}');
  }

  @override
  void didUpdateWidget(FirstPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isShow) {
      log('didUpdateWidget 显示了${widget.isShow}');
    }
  }

  @override
  void deactivate() {
    log('执行了deactivate方法');
    super.deactivate();
  }

  @override
  void dispose() {
    log('执行了dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,

        itemBuilder: (BuildContext ctx, int index) {
          return ListTile(
            leading: Icon(Icons.favorite, size: 22, color: Colors.red,),
            title: Text('第$index项'),
          );
        }


    );
  }
}
