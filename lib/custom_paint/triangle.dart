import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Triangle extends LeafRenderObjectWidget {
  final Color color;
  final double width;
  final double radius;

  const Triangle({
    Key? key,
    this.color = Colors.black,
    this.radius = 0,
    required this.width,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderTriangle(width, color, radius: radius);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderObject renderObject) {
    super.updateRenderObject(context, renderObject);
    (renderObject as _RenderTriangle)
      ..color = color
      ..width = width
      ..radius = radius;
  }
}

class _RenderTriangle extends RenderBox {
  double width;

  Color color;

  double radius;

  _RenderTriangle(this.width, this.color, {this.radius = 0});

  @override
  void performLayout() {
    size = Size(width, width / 2);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = color;

    /// 平移 offset
    canvas.translate(offset.dx, offset.dy);

    /// 要使用的绘制区域
    // canvas.drawRect(Rect.fromLTRB(0, 0, width, width),
    //     Paint()..color = Colors.red);

    ///下半部分区域  参考用
    // canvas.drawRect(Rect.fromLTRB(0, width / 2, width, width),
    //     Paint()..color = Colors.green);

    canvas.clipRect(Rect.fromLTRB(0, 0, size.width, size.height));

    /// 像右位移一般宽度
    canvas.translate(size.width / 2, 0);

    /// 旋转 1/4 圆
    canvas.rotate(pi / 4);

    /// 绘制全屏大小的圆角矩形
    canvas.drawRRect(
        RRect.fromLTRBR(
            0, 0, width, width, Radius.circular(radius)),
        paint);
  }

}

class _TrianglePainter extends CustomPainter {
  final Color color;

  double radius;

  _TrianglePainter(this.color, {this.radius = 20});

  @override
  void paint(Canvas canvas, Size size) {
    print('===>>>>  size = $size');
    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = color;

    final minSideSize = size.shortestSide;

    if (radius > minSideSize) radius = minSideSize;

    drawTriangleByRRect(canvas, size, paint);

    // canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height),
    //     Paint()..color = Colors.red);
    //
    // final path = Path();
    // path.moveTo(0, size.height);
    // // path.lineTo(size.width / 2 - radius, radius/2);
    // path.relativeArcToPoint(Offset(size.width, 0),
    //     radius: Radius.circular(radius),
    //     largeArc: true,
    //     clockwise: false,
    //     rotation: pi / 2);
    // // path.lineTo(size.width, size.height);
    // path.close();
    // canvas.drawPath(path, paint);
  }

  void drawTriangleByRRect(Canvas canvas, Size size, Paint paint) {
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height),
        Paint()..color = Colors.red);

    canvas.drawRect(Rect.fromLTRB(0, size.width / 2, size.width, size.height),
        Paint()..color = Colors.green);

    //裁切画布仅保留上半部分
    canvas.clipRect(Rect.fromLTRB(0, 0, size.width, size.height / 2));

    /// 像右位移一般宽度
    canvas.translate(size.width / 2, 0);

    /// 旋转 1/4 圆
    canvas.rotate(pi / 4);

    /// 绘制全屏大小的圆角矩形
    canvas.drawRRect(
        RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(radius)),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      color != (oldDelegate as _TrianglePainter).color ||
      radius != (oldDelegate).radius;
}
