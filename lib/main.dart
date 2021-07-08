import 'package:first_flutter_demo/page/page.dart';
import 'package:first_flutter_demo/widget/tag_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(createApp());
}

Widget createApp() {
  ///定义路由
  final AbstractRoutes routes = PageRoutes(
    pages: {
      "FirstPage": FirstPage(),
    },
  );

  return MaterialApp(
    title: 'FishRedux',
    home: routes.buildPage("FirstPage", null), //作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      //ios页面切换风格
      return CupertinoPageRoute(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
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
        primarySwatch: Colors.purple,
      ),
      // home: FirstAnimatePage(),
      // home: FirstTransition(),
      // home: Transition478(),
      // home: CustomPaintTransition(),
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
      body: Container(
        width: 300,
        height: 400,
        color: Colors.purple,
        child: getBody(),
      ),
      // body: ArcWidget(height: 140,),
      // body: WaveWidget(),
      // body: Layout2(),
    );
  }
}

Widget getBody() {
  return Align(
    alignment: Alignment.center,
    child: SimpleTagWidget(
      "我是 tag",
      padding: EdgeInsets.all(10),
      borderColor: Colors.red,
      borderRadius: 40,
    ),
  );
}
