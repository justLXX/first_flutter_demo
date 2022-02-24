import 'dart:math';

import 'package:first_flutter_demo/animate/widget/WaveWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///tweenAnimtion
class CustomPaintTransition extends StatefulWidget {
  final String title = "CustomPaint";

  const CustomPaintTransition({Key? key}) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<CustomPaintTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.blue,
          height: 400,
          child: Row(
            children: [
              WaveContainer(offset: 0, height: 200),
              WaveContainer(offset: pi, height: 200),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("press");
          _controller.stop();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
