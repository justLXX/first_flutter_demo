import 'package:flutter/material.dart';

const double CONTAINER_HEIGHT = 100;

/// https://api.flutter.dev/flutter/animation/Curves-class.html
class CurvesDemo extends StatefulWidget {
  const CurvesDemo({Key key}) : super(key: key);

  @override
  _CurvesDemoState createState() => _CurvesDemoState();
}

class _CurvesDemoState extends State<CurvesDemo> {
  final duration = Duration(seconds: 2);
  double opacity = 1;
  //因为旋转控件内部自动x 2pi，所有大部分情况设置 0-1 之间的数就行
  double turns = 0;
  double scale = 1;
  double translationY = 0;

  bool end = false;

  Curve _curve = Curves.elasticIn;

  void resetValue() {
    end = false;
    opacity = 1;
    turns = 0;
    scale = 1;
    translationY = 0;
  }

  void endValue() {
    end = true;
    opacity = 0.5;
    turns = 1;
    scale = 2;
    translationY = CONTAINER_HEIGHT;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CurvesDemo'),
      ),
      body: Container(
        color: Colors.grey,
        height: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnimatedPadding(
              curve: _curve,
              padding: EdgeInsets.only(top: translationY),
              duration: duration,
              child: Box(color: Colors.yellow),
            ),
            AnimatedRotation(
              curve: _curve,
              turns: turns,
              duration: duration,
              child: Box(color: Colors.green),
            ),
            AnimatedScale(
              curve: _curve,
              scale: scale,
              duration: duration,
              child: Box(color: Colors.blue),
            ),
            AnimatedOpacity(
              curve: _curve,
              opacity: opacity,
              duration: duration,
              child: Box(color: Colors.red),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            if (end) {
              resetValue();
            } else {
              endValue();
            }
          });
        },
      ),
    );
  }
}

class Box extends StatelessWidget {
  final Color color;

  const Box({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: CONTAINER_HEIGHT / 2,
      height: CONTAINER_HEIGHT,
    );
  }
}
