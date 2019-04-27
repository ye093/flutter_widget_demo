import 'package:flutter/material.dart';

/// 绘制指定的图像
class CustomPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义绘制'),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(300, 300),
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  // 总行数
  static final sumRows = 15;

  // 总列数
  static final sumColumns = 15;

  @override
  void paint(Canvas canvas, Size size) {
    // 列大小
    final columnWidth = size.width / sumColumns;
    // 行大小
    final rowWidth = size.height / sumRows;

    // 画棋背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill // 填充
      ..color = Color(0x77cdb175); // 背景置为纸黄色
    canvas.drawRect(Offset.zero & size, paint);
    // 等效下面的代码
//    canvas.drawRect(Rect(0.0, 0.0, size.width, size.height), paint);

    // 画棋盘网格
    paint
      ..style = PaintingStyle.stroke // 线
      ..color = Colors.black38
      ..strokeWidth = 1.0;
    // 画行
    for (int i = 0; i < sumRows + 1; i++) {
      double dy = i.toDouble() * rowWidth;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint); // 起点 -> 终点
    }
    // 画列
    for (int i = 0; i < sumColumns + 1; i++) {
      double dx = i.toDouble() * columnWidth;
      canvas.drawLine(Offset(dx, 0.0), Offset(dx, size.height), paint);
    }

    // 画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(Offset(3, 2) * rowWidth, rowWidth / 2, paint);

    // 画一个白子
    paint
      ..color = Colors.white;
    canvas.drawCircle(Offset(4, 3) * columnWidth, columnWidth / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
