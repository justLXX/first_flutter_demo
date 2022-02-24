import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///翻滚数字控件
class FiveAnimation extends StatefulWidget {
  final String title = "Five 翻滚数字";

  const FiveAnimation({Key? key}) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<FiveAnimation> {

  var end = 6.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          width: 300,
          height: 120,
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: 400),
            tween: Tween(begin: 7.0, end: end),
            builder: (context, dynamic value, child) {
              final whole = value ~/ 1;
              final decimal = value - whole;
              print("$whole   ---  $decimal");
              return Stack(
                children: <Widget>[
                  Positioned(
                    top: -100 * decimal as double?, //0 -> -100
                    child: Opacity(
                      opacity: 1 - decimal as double, //1.0 -> 0.0
                      child: Text(
                        '$whole',
                        style: TextStyle(fontSize: 100),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100 - (100 * decimal as double), //100 -> 0
                    child: Opacity(
                      opacity: decimal, // 0 -> 1
                      child: Text(
                        "${whole + 1}",
                        style: TextStyle(fontSize: 100),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            var rng = new Random();
            end = rng.nextInt(10).toDouble();
            print('end = $end');
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
