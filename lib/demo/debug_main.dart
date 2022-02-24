import 'package:first_flutter_demo/animate/widget/WaveWidget.dart';
import 'package:first_flutter_demo/demo/snow.dart';
import 'package:first_flutter_demo/demo/transform_demo.dart';
import 'package:first_flutter_demo/demo/tween_animation_builder_demo.dart';
import 'package:flutter/material.dart';

import 'animate_switch.dart';
import 'animation_controller_demo.dart';
import 'curves_demo.dart';
import 'implicit_animation.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Debug',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画111'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.cyan,
          child: Center(
            child: Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
