import 'package:flutter/material.dart';

const double CONTAINER_HEIGHT = 100;

class AnimationControllerDemo extends StatefulWidget {
  const AnimationControllerDemo({Key key}) : super(key: key);

  @override
  _AnimationControllerDemoState createState() => _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      lowerBound: 3,
      upperBound: 5,
    );

    _controller.addListener(() {
      print('value = ${_controller.value}');
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CurvesDemo'),
      ),
      body: Center(
        child: Container(
          width: 300,
          color: Colors.grey,
          height: 300,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {

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
