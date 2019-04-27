import 'package:flutter/material.dart';

class SysButtonList extends StatefulWidget {
  SysButtonList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SysButtonList> {
  bool singleBoxState;

  final fruits = const <String>['苹果', '草莓', '香蕉'];

  String _fruit = '苹果';

  _MyHomePageState({this.singleBoxState = false});

  onRadioSelected(value) {
    setState(() {
      _fruit = value;
    });
    print('你选择了$value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 10.0,
          children: <Widget>[
            RaisedButton(
              child: Text('RaisedButton'),
              onPressed: () => {},
            ),
            MaterialButton(
              onPressed: () => {},
              child: Text('MaterialButton'),
            ),
            FlatButton(
              onPressed: () => {},
              child: Text('FlatButton'),
            ),
            OutlineButton(
              onPressed: () => {},
              child: Text('OutlineButton'),
            ),
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.thumb_up),
            ),
            RawMaterialButton(
              fillColor: Colors.blue,
              splashColor: Colors.lightBlue,
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              onPressed: () => {},
              child: Text(
                'RawMaterialButton',
                style: TextStyle(color: Colors.white),
              ),
            ),
            FlatButton(
              color: Colors.blue,
              splashColor: Colors.lightBlue,
              shape: StadiumBorder(),
              onPressed: () => {},
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              splashColor: Colors.lightBlue,
              shape: StadiumBorder(),
              onPressed: () => {},
              child: Text(
                'RaisedButton->Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Image.network(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
              width: 100,
            ),
            Checkbox(
              value: singleBoxState,
              onChanged: (value) => setState(() => singleBoxState = value),
            ),
            Switch(
                value: singleBoxState,
                onChanged: (value) => setState(() => singleBoxState = value)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio<String>(
                      value: fruits[0],
                      groupValue: _fruit,
                      onChanged: onRadioSelected,
                    ),
                    Text(fruits[0]),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio<String>(
                      value: fruits[1],
                      groupValue: _fruit,
                      onChanged: onRadioSelected,
                    ),
                    Text(fruits[1]),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Radio<String>(
                        value: fruits[2],
                        groupValue: _fruit,
                        onChanged: onRadioSelected,
                      ),
                    ),
                    Text(fruits[2]),
                  ],
                ),
                Text.rich(TextSpan(
                    text: 'http://',
                    style: const TextStyle(color: Colors.yellow),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'www.',
                        style: const TextStyle(color: Colors.red),
                      ),
                      TextSpan(
                        text: 'baidu',
                        style: const TextStyle(color: Colors.lightBlue),
                      ),
                      TextSpan(
                        text: '.com',
                        style: const TextStyle(color: Colors.orange),
                      ),
                    ])),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}