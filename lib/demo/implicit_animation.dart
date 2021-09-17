import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({Key key}) : super(key: key);

  @override
  _ImplicitAnimationState createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  double _padding = 100.0;
  static const  double CONTAINER_HEIGHT = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImplicitAnimation'),
      ),
      body: LayoutBuilder(builder: (context, constrains) {
        return AnimatedPadding(
          // curve: Curves.bounceIn,
          padding: EdgeInsets.only(top: _padding),
          duration: Duration(seconds: 1),
          child: Container(
            width: 300,
            height: CONTAINER_HEIGHT,
            color: Colors.lightBlueAccent,
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            var height = MediaQuery.of(context).size.height;
            _padding += 100;
            if (height < _padding + CONTAINER_HEIGHT) {
              _padding = 0;
            }
          });
        },
      ),
    );
  }
}
