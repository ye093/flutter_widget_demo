import 'package:flutter/cupertino.dart';

/// 苹果风格的首页导航
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          title: Text('首页'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book),
          title: Text('订阅'),
        ),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车'))
      ]),
      tabBuilder: (BuildContext context, int index) {
        // 标题
        String tabTitle = index == 0 ? '首页' : (index == 2 ? '订阅' : '购物车');

        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text(tabTitle),
                ),
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (BuildContext context, int itemIndex) {
                      return Container(
                        padding: EdgeInsets.all(20),
                        alignment: AlignmentDirectional.centerStart,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Icon(
                              CupertinoIcons.profile_circled,
                              color: CupertinoColors.destructiveRed,
                              size: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '第$index第$itemIndex项',
                              style: TextStyle(color: Color(0xff000000)),
                            ),
                            CupertinoButton(
                              onPressed: () => print('吩咐吩咐'),
                              child: Container(
                                  child: Text('按钮')),
                            )
                          ],
                        ),
                      );
                    }));
          },
        );
      },
    );
  }
}
