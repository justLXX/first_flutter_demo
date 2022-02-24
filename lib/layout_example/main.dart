import 'package:first_flutter_demo/layout_example/custom_render_object.dart';
import 'package:first_flutter_demo/layout_example/multy_layout_demo.dart';
import 'package:first_flutter_demo/layout_example/stack_demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // DartTest().testFuture();
  runApp(MyApp());
  print('main 结束');
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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        // body: buildShadowBox(),
        // body: buildStackDemo(),
        // body: buildUnConstrainsDemo(),
        body: buildCustomLayoutDemo(),
      ),
    );

    // return Container(
    //   color: Colors.white,
    //   child: Center(
    //     child: Container(
    //       color: Colors.blueAccent,
    //       width: 300,
    //       height:300
    //     ),
    //   ),
    // );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //注册路由表
      routes: {},

      home: Scaffold(
        appBar: AppBar(
          title: Text('layout'),
        ),
        // body: Container(
        //   // width: 400,
        //   // height: 400,
        //   color: Colors.red[300],
        //   child: Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: FlutterLogo(
        //       size: 300,
        //     ),
        //   ),
        // ),

        body: Container(
          color: Colors.red[200],
          child: Container(
            // width: double.infinity,
            child: Column(
              children: [
                FlutterLogo(
                  size: 200,
                ),
                Text('你好 HelloWord'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

buildCustomLayoutDemo(){
  return MyCustomLayout();
}

buildShadowBox() {
  return Container(
    color: Colors.red,
    child: ShadowBox(
        child:Icon(
          Icons.add,
          size: 280,
        ),
        distance: 20),
  );
}

buildStackDemo() => Align(alignment: Alignment.bottomRight, child: StackDemo());

buildUnConstrainsDemo() => UnconstrainedBox(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          print('===>>> constrains = $constraints');
          return Container(color: Colors.red, width: 2000, height: 50);
        },
      ),
    );
