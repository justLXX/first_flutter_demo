import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///tweenAnimtion
class Transition478 extends StatefulWidget {
  final String title = "tweenAnimtion";

  const Transition478({Key? key}) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<Transition478>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 20),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Animation animation1 = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Interval(0.0, 0.2)))
        .animate(_controller);

    Animation animation2 = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Interval(0.0, 0.2)))
        .animate(_controller);

    Animation animation3 = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Interval(0.4, 0.95)))
        .animate(_controller);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.blue[600]!,
                    Colors.blue[100]!,
                  ],
                  stops: _controller.value <= 0.2
                      ? [animation1.value, animation1.value + 0.1]
                      : [animation3.value, animation3.value + 0.1],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.repeat(reverse: true);
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
