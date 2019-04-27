import 'package:flutter/material.dart';


class InputAndForm extends StatefulWidget {
  InputAndForm({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _InputAndFormState();
  }
}

class _InputAndFormState extends State<InputAndForm> {
  FocusNode _focusNode1, _focusNode2;
  FocusScopeNode _focusScopeNode;

  _InputAndFormState()
      : _focusNode1 = new FocusNode(),
        _focusNode2 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'input1'),
            focusNode: _focusNode1,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'input2'),
            focusNode: _focusNode2,
          ),
          RawMaterialButton(
            fillColor: Colors.blue,
            splashColor: Colors.lightBlue,
            onPressed: () {
              if (_focusScopeNode == null) {
                _focusScopeNode = FocusScope.of(context);
              }
              _focusScopeNode.requestFocus(_focusNode2);
            },
            child: Text('焦点移至input2'),
          ),
          RaisedButton(
            color: Colors.blue,
            splashColor: Colors.lightBlue,
            onPressed: (){
              _focusNode1.unfocus();
              _focusNode2.unfocus();
            },
            child: Text('收起键盘'),
          ),
        ],
      ),
    );
  }
}