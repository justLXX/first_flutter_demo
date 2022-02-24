import 'package:flutter/material.dart';

import 'custom_render_object.dart';

void main() {
  runApp(Layout_1_App());
}

class Layout_1_App extends StatelessWidget {
  const Layout_1_App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            width: 400,
            height: 400,
            color: Colors.blue,
            child: Center(
              child: ShadowBox(
                color: Colors.red,
                onPointerDown: (event) {
                  print('=======>>> color = 红');
                },
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: ShadowBox(
                    onPointerDown: (event) {
                      print('=======>>> color = 绿');
                    },
                    color: Colors.green,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
