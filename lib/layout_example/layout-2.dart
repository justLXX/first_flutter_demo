import 'package:first_flutter_demo/layout_example/custom_render_object.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Layout_2_App());
}

class Layout_2_App extends StatelessWidget {
  const Layout_2_App({Key? key}) : super(key: key);

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
                child: GestureDetector(
                  onTap: (){
                    print('=======>>> onTap');
                  },
                  child: Container(
                    color: Colors.red,
                    width: 200,
                    height: 200,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ShadowBox(
                        onPointerDown: (event) {
                          print('=======>>> color = 绿');
                        },
                        color: Colors.green,
                        child: Container(
                          color: Colors.green,
                          width: 100,
                          height: 50,
                        ),
                      ),
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
