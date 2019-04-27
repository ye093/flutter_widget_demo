import 'package:flutter/material.dart';

class FancyButton extends StatefulWidget {
  final GestureTapCallback onPress;

  FancyButton({Key key, @required this.onPress}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FancyButtonState();
  }
}

class _FancyButtonState extends State<FancyButton> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: RawMaterialButton(
        onPressed: widget.onPress,
        fillColor: Colors.orange,
        splashColor: Colors.amber,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        shape: const StadiumBorder(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(Icons.explore, color: Colors.deepOrange),
            SizedBox(width: 20,),
            Text(
              '提交',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
