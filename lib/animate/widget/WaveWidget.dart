import 'dart:math';

import 'package:flutter/material.dart';

class WaveWidget extends StatefulWidget {
  const WaveWidget({Key key, this.height, this.offset}) : super(key: key);

  final double height;
  final double offset;

  @override
  _WaveWidgetState createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _container;

  @override
  void initState() {
    _container = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
        upperBound: 2 * pi,
        lowerBound: 0);
    _container.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _container.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: widget.height,
          width: 180,
          child: AnimatedBuilder(
            builder: (BuildContext context, Widget child) {
              return CustomPaint(
                painter: _WavePainter(_container.value + widget.offset),
              );
            },
            animation: _container,
          ),
        );
      },
    );
  }
}

class _WavePainter extends CustomPainter {
  final double value;

  _WavePainter(this.value);

  final white = Paint()
    ..color = Colors.white.withAlpha(60)
    ..style = PaintingStyle.fill
    ..strokeWidth = 10
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()
      ..color = Colors.white.withAlpha(60);
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);
    final endPointX = size.width ;
    final controlX = size.width * 0.5 ;

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(
        controlX, controlPointY, endPointX, endPointY);
    // path.quadraticBezierTo(
    //     size.width * 0.25, controlPointY, endPointX, endPointY);
    path.lineTo(endPointX, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }


  void drawSin(Canvas canvas, Size size) {
    print('width = ${size.width}');
    final path = Path();
    var starY = getY(size, 0);
    path.moveTo(0, starY);
    for (var i = 0; i < size.width + 100; i += 10) {
      var x = i.toDouble();
      var y = getY(size, x + value);
      path.lineTo(x, y);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }

  double getY(Size size, double x) {
    var y = sin(value + x * 2 * pi / size.width);
    return size.height * (0.5 + 0.1 * y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
