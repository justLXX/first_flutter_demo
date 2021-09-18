import 'package:first_flutter_demo/utils/log.dart';
import 'package:flutter/material.dart';


class AnimationControllerDemo extends StatefulWidget {
  const AnimationControllerDemo({Key key}) : super(key: key);

  @override
  _AnimationControllerDemoState createState() => _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  int count = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    _controller.addListener(() {
      count++;
      printLog('value = ${_controller.value}  count = $count');
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
        title: Text('AnimationControllerDemo'),
      ),
      body: Center(
        // child:ScaleAnimateBox(controller: _controller),
        child:SlideAnimateBox(controller: _controller),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            count = 0;
            _controller.reset();
            _controller.forward();
            // _controller.repeat(); //重复
          });
        },
      ),
    );
  }
}

class ScaleAnimateBox extends StatelessWidget {
  final AnimationController controller;

  ScaleAnimateBox({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      // scale: controller.drive(Tween(begin: 0.5,end:2)),
      scale: controller,
      child: Container(
        width: 300,
        color: Colors.cyan,
        height: 300,
      ),
    );
  }
}

class SlideAnimateBox extends StatelessWidget {
  final AnimationController controller;

  SlideAnimateBox({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween(begin: Offset.zero, end: Offset(0.0, 1.0))
          .chain(CurveTween(curve: Curves.elasticInOut))
          .chain(CurveTween(curve: Interval(0.5, 0.6)))/// 区间 表示在此区间内完成整个动画
          .animate(controller),
      child: Container(
        width: 300,
        color: Colors.cyan,
        height: 300,
      ),
    );
  }
}
