import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

///tweenAnimtion
class FourthTweenAnimation extends StatefulWidget {
  final String title = "Second";

  const FourthTweenAnimation({Key key}) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<FourthTweenAnimation> {
  @override
  void initState() {
    super.initState();
  }

  double end = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(seconds: 1),
          tween: Tween(begin: 0.00, end: end),
          builder: (BuildContext context, value, Widget child) {
            return Opacity(
              opacity: value,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                color: Colors.blue,
                width: 300,
                height: 300,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            var rng = new Random();
            end = rng.nextDouble();
            print('end = $end');
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

}
