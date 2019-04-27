import 'package:flutter/material.dart';

// 通知监听事件
class MyNotification extends StatefulWidget {
  MyNotification({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyNotificationState();
  }
}

class _MyNotificationState extends State<MyNotification> {

  String _msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通知事件测试'),
      ),
      body: NotificationListener<Message>(
        onNotification: (notification) {
          setState(() {
            _msg = notification.msg;
            print(_msg);
          });
        },
        child: Column(
          children: <Widget>[
            //          RaisedButton(
//           onPressed: () => MyNotification("Hi").dispatch(context),
//           child: Text("Send Notification"),
//          ),

          //注意：代码中注释的部分是不能正常工作的，因为这个context是根Context，而NotificationListener是监听的子树，所以我们通过Builder来构建RaisedButton，来获得按钮位置的context。
            Builder(
              builder: (BuildContext context) {
                return RaisedButton(
                    color: Colors.blue,
                    splashColor: Colors.lightBlue[600],
                    onPressed: () => Message('${DateTime.now()}').dispatch(context),
                    child: Text('按钮', style: TextStyle(color: Colors.white),),
                  );
              },
            ),
            Text(_msg ?? 'HelloWorld'),
          ],
        ),
      )
    );
  }
}

class Message extends Notification {
  Message(this.msg);

  final String msg;
}
