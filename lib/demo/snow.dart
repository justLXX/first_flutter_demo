import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnowAnimateWidget extends StatefulWidget {
  const SnowAnimateWidget({Key key}) : super(key: key);

  @override
  _SnowWidgetState createState() => _SnowWidgetState();
}

class _SnowWidgetState extends State<SnowAnimateWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  List<SnowFlake> snowFlakes = List.generate(100, (index) => SnowFlake());

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: AnimatedBuilder(
        builder: (BuildContext context, Widget child) {
          snowFlakes.forEach((snow) => snow.fall());
          return CustomPaint(
            painter: SnowPainter(snowFlakes),
          );
        },
        animation: _controller,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.blueAccent, Colors.blue],
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          stops: [0.0, 0.7, 0.95],
        ),
      ),
    );
  }
}

class SnowPainter extends CustomPainter {
  SnowPainter(this.flakes);

  List<SnowFlake> flakes = [];
  Paint snowManPaint = Paint()..color = Colors.white;
  Paint snowFlakePaint = Paint()..color = Colors.white;

  @override
  void paint(Canvas canvas, Size size) {
    print('size = $size');
    canvas.drawCircle(size.center(Offset(0, 150)), 60, snowManPaint);
    canvas.drawOval(Rect.fromCenter(center: size.center(Offset(0, 300)), width: 200, height: 250), snowManPaint);
    flakes.forEach((element) {
      canvas.drawCircle(Offset(element.x, element.y), element.radius, snowFlakePaint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
    return (oldDelegate as SnowPainter).flakes != this.flakes;
  }
}

class SnowFlake {
  double x = Random().nextDouble() * 392.7;
  double y = Random().nextDouble() * 800;
  double radius = Random().nextDouble() * 2 + 2;
  double velocity = Random().nextDouble() * 4 + 2;

  void fall() {
    y += velocity;
    if (y > 800) {
      y = 0;
      x = Random().nextDouble() * 392.7;
      radius = Random().nextDouble() * 2 + 2;
      velocity = Random().nextDouble() * 4 + 2;
    }
  }
}
