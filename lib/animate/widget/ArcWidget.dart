import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 弧形背景
class ArcWidget extends StatelessWidget {
  final double? height;

  const ArcWidget({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: height ?? double.infinity,
      child: _DrawArc(
        color: Colors.blue,
      ),
    );
  }
}

class _DrawArc extends StatelessWidget {
  final color;

  const _DrawArc({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.purple,
      child: CustomPaint(
        painter: _DrawArcPainter(color),
      ),
    );
  }
}

class _DrawArcPainter extends CustomPainter {
  final Color? color;

  _DrawArcPainter(this.color);

  final double offsetY = -100;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCenter(
        center: size.center(Offset.zero),
        width: size.width,
        height: size.height);

    final gradient = LinearGradient(colors: [Colors.green[200]!,Colors.green]);

    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(rect)
      ..color = color!
    ;

    var path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height / 2);
    path.addArc(
        Rect.fromCenter(
            center: size.bottomCenter(Offset(0.0, offsetY / 2)),
            width: size.width * 1.2,
            height: offsetY.abs()),
        0,
        2 * pi / 2);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _ClipArc extends StatelessWidget {
  const _ClipArc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: _MyPathClipper(),
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
        ),
      ),
    );
  }
}

class _MyPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height / 2);
    // path.lineTo(size.width/2, size.height);
    // path.lineTo(size.width, size.height/2);
    var centerRight = Offset.zero;
    path.arcToPoint(
      size.centerRight(centerRight),
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
