import 'dart:math';

import 'package:flutter/material.dart';

import 'curves_demo.dart';

/// https://flutter.dev/docs/development/ui/widgets/layout
class TransformDemo extends StatefulWidget {
  const TransformDemo({Key key}) : super(key: key);

  @override
  _TransformDemoState createState() => _TransformDemoState();
}

class _TransformDemoState extends State<TransformDemo> {
  final duration = Duration(seconds: 2);
  double end = 1;

  void resetValue() {
    end = 0;
  }

  void endValue() {
    end = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransformDemo'),
      ),
      body: Container(
        color: Colors.grey,
        height: double.infinity,
        child: TweenAnimationBuilder(
            builder: (BuildContext context, double value, Widget child) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Transform.translate(
                    offset: Offset(0, value * 500),
                    child: Box(color: Colors.yellow),
                  ),
                  Transform.rotate(
                    angle: 2 * value * pi,
                    child: Box(color: Colors.green),
                  ),
                  Transform.scale(
                    scale: 0.5 + value * 0.5,
                    child: Box(color: Colors.blue),
                  ),
                ],
              );
            },
            tween: Tween(end: end),
            duration: duration),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            if (end == 1) {
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
