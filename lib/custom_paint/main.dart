import 'package:first_flutter_demo/const.dart';
import 'package:first_flutter_demo/custom_paint/triangle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String? title;

  MyApp({Key? key, this.title}) : super(key: key) {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('customPainter'),
      ),
      // body: Container(
      //   decoration: BoxDecoration(),
      //   // child: DecoratedBox(),
      // ),
      body: Center(
        child: RotatedBox(
          quarterTurns: 1,
          child: Container(
            color: Colors.blue,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Triangle(width: 200,),
                // Triangle(width: 200,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


