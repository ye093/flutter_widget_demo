import 'package:flutter/material.dart';

/// 自定义控件
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义控件测试'),
      ),
      body: Center(child: MyCustomPaint()),
    );
  }
}

class MyCustomPaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(300, 300),
      painter: _MyCustomPainter(),
    );
  }
}

class _MyCustomPainter extends CustomPainter {
  static final int rowNum = 15;

  @override
  void paint(Canvas canvas, Size size) {
    //先画一个背景
    var paint = Paint()
      ..color = Color(0x77cdb175)
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    canvas.drawRect(Offset(0, 0) & size, paint);

    // 每格的大小
    double boxW = size.width / rowNum;
    //画行和列
    paint
      ..color = Colors.black87
      ..strokeWidth = .5
      ..style = PaintingStyle.stroke;
    for (int i = 0; i < rowNum + 1; i++) {
      // 行
      double dy = boxW * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
      // 列
      canvas.drawLine(Offset(dy, 0), Offset(dy, size.height), paint);
    }

    // 画白子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    canvas.drawCircle(Offset(7, 7) * boxW, boxW / 2, paint);
    // 画黑子
    paint.color = Colors.black;
    canvas.drawCircle(Offset(6, 5) * boxW, boxW / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
