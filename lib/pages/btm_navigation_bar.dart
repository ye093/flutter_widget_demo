import 'package:flutter/material.dart';

// 测试一下
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationTest();
  }
}

/// BottomNavigationBar
class BottomNavigationTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationTestState();
  }
}

// AutomaticKeepAliveClientMixin 保存页面间的状态
class _BottomNavigationTestState extends State<BottomNavigationTest>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  final _tabIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this)
      ..addListener(() => setState(() {
            _tabIndex.value = _tabController.index;
          }));
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('底部导航'),
        ),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: _tabIndex,
          builder: (context, newIndex, _) {
            return BottomNavigationBar(
                currentIndex: newIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  if (index != _tabController.index) {
                    _tabController.animateTo(index);
                  }
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text('首页')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.business), title: Text('商业')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), title: Text('购物车')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.perm_identity), title: Text('我的')),
                ]);
          },
        ),
        body: TabBarView(controller: _tabController, children: <Widget>[
          ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.orange,
                    size: 28,
                  ),
                  title: Text('你好啊这是首页第$index'),
                );
              }),
          ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.orange,
                    size: 28,
                  ),
                  title: Text('你好啊这是商业第$index'),
                );
              }),
          ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.orange,
                    size: 28,
                  ),
                  title: Text('你好啊这是购物车第$index'),
                );
              }),
          ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.orange,
                    size: 28,
                  ),
                  title: Text('你好啊这是我的第$index'),
                );
              }),
        ]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
