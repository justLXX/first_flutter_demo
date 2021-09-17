import 'package:first_flutter_demo/const.dart';
import 'package:first_flutter_demo/widget/scale_gide_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart_grammar_test.dart';

void main() {
  DartTest().testFuture();
  // runApp();
  print('main 结束');
}

class MyApp extends StatelessWidget {
  final String title;

  MyApp({Key key, this.title}) : super(key: key) {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      //注册路由表
      routes: {}..addAll(groupRoutes)..addAll(animateRoutes)..addAll(customWidgetRoutes),

      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstFlutter'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: groupRoutes.entries
              .map((entry) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, entry.key);
                      // DartTest().testFuture();
                    },
                    child: Container(
                      width: double.infinity,
                      color: Colors.green,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: Center(
                          child: Text(
                        entry.key,
                        style: TextStyle(fontSize: 16),
                      )),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

Widget getBody() {
  return ScaleWidget();
}
