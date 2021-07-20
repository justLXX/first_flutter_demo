import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///tweenAnimtion
class FirstTransition extends StatefulWidget {
  final String title = "Second";

  const FirstTransition({Key key}) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<FirstTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
            duration: Duration(seconds: 1),
            vsync: this,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
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
