import 'package:first_flutter_demo/animate/widget/WaveWidget.dart';
import 'package:first_flutter_demo/demo/snow.dart';
import 'package:first_flutter_demo/demo/transform_demo.dart';
import 'package:first_flutter_demo/demo/tween_animation_builder_demo.dart';
import 'package:first_flutter_demo/demo/widget_test/gridview_test/gridview_add_animate_test.dart';
import 'package:flutter/material.dart';

import 'animate_switch.dart';
import 'animation_controller_demo.dart';
import 'curves_demo.dart';
import 'implicit_animation.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),

    //注册路由表
    routes: realRouters,

    home: HomePage(),
  ));
}

/// 自己处理scaffold
Map<String, Widget> routes = {
  'ImplicitAnimation': ImplicitAnimation(),
  'CurvesDemo': CurvesDemo(),
  'TweenAnimationBuilderDemo': TweenAnimationBuilderDemo(),
  'AnimationControllerDemo': AnimationControllerDemo(),
  'TransformDemo': TransformDemo(),
};

/// 仅展示 Widget
Map<String, Widget> simpleRoutes = {
  'CustomPaint': WaveContainer(),
  'SnowAnimateWidget': SnowAnimateWidget(),
  'AnimatedSwitchDemo': AnimatedSwitchDemo(),
  'GridviewTest': GridviewTest(),
};

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Wrap(
        children: FontWeight.values.map((e) => buildText(e)).toList(),
        // children: [
        //   buildText(FontWeight.w300),
        //   buildText(FontWeight.w400),
        //   buildText(FontWeight.w500),
        //   buildText(FontWeight.w600),
        //   buildText(FontWeight.w700),
        // ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: realRouters.entries
            .map(
              (entry) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, entry.key);
                },
                child: Container(
                  width: double.infinity,
                  color: Colors.green,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Center(
                      child: Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildText(FontWeight weight) {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 14, fontWeight: weight,color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('$weight'),
            Text('abfgh'),
            Text('大小国'),
            Text('1589'),
            Text('abfgh大小国1589'),
          ],
        ),
      ),
    );
  }
}

Map<String, WidgetBuilder> realRouters = getRealRoutes();

Map<String, WidgetBuilder> getRealRoutes() {
  Map<String, WidgetBuilder> map = {};
  simpleRoutes.forEach((key, value) {
    map[key] = (context) => createPage(key, value);
  });
  routes.forEach((key, value) {
    map[key] = (context) => value;
  });

  return map;
}

Widget createPage(String name, Widget body) {
  return Scaffold(
    appBar: AppBar(
      title: Text(name),
    ),
    body: body,
  );
}
