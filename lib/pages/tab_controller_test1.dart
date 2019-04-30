import 'package:flutter/material.dart';

/// tab controller
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyContentPage();
  }
}

class MyContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyState();
  }

}

class _MyState extends State<MyContentPage> with SingleTickerProviderStateMixin {
  final activePageIndex = ValueNotifier<int>(0);

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        if (_tabController.index != activePageIndex.value) {
          activePageIndex.value = _tabController.index;
        }
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: ValueListenableBuilder(
            valueListenable: activePageIndex,
            builder: (BuildContext ctx, int index, _) {
              return BottomNavigationBar(
                currentIndex: index,
                onTap: (int newIndex) {
                  if (newIndex != activePageIndex.value) {
                    activePageIndex.value = newIndex;
                    _tabController.index = newIndex;
                  }
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text('首页')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.business), title: Text('商业')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.school), title: Text('学校')),
                ],
              );
            },
          ),
          appBar: AppBar(
            title: Text('Tab Controller'),
          ),
          body: TabBarView(controller: _tabController, children: [
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
        ));
  }
}
