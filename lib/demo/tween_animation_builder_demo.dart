import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenAnimationBuilderDemo extends StatefulWidget {
  const TweenAnimationBuilderDemo({Key key}) : super(key: key);

  @override
  _TweenAnimationBuilderDemoState createState() => _TweenAnimationBuilderDemoState();
}

class _TweenAnimationBuilderDemoState extends State<TweenAnimationBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CurvesDemo'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 50.0, end: 100.0),
          builder: (BuildContext context, value, Widget child) {
            return Container(
              color: Colors.blue,
              width: 300,
              height: 300,
              child: Text('Flutter', style: TextStyle(fontSize: value)),
            );
          },
          duration: Duration(seconds: 2),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}
