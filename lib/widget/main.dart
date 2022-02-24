import 'package:first_flutter_demo/widget/page_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Widget> myTabs = [
    Tab(text: 'one'),
    Tab(text: 'two'),
    Tab(text: 'three'),
  ];

  late var _controller = AnimationController(
    duration: Duration(seconds: 1),
    vsync: this,
  );

  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  _listItem() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.blueAccent,
        ),
      ),
      height: 120,
      child: Center(
        child: Text('List Item', style: TextStyle(fontSize: 20.0)),
      ),
    );
  }

  _printSize() {
    if (mounted) {
      var size = context.findRenderObject()?.paintBounds.size;
      print("_printSize  中 size = "+size.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    int index = _tabController.index;

         return Scaffold(
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              labelColor: Colors.redAccent,
              tabs: myTabs,
            ),
            AnimatedContainer(
              duration: Duration(
                seconds: 1,
              ),
              color: Colors.primaries[index],
              child: NotificationListener<LayoutChangedNotification>(
                onNotification: (notification) {
                  if (mounted) {
                    var size = context.findRenderObject()?.paintBounds.size;
                    print(size.toString());
                  }
                  _printSize();
                  return false;
                },
                child: SizeChangedLayoutNotifier(
                  child: SizedBox(height: 20.0 * index),
                ),
              ),
            ),
          ],
        )
    );


    return Scaffold(
      body: ListView(
        children: [
          _listItem(),
          TabBar(
            controller: _tabController,
            labelColor: Colors.redAccent,
            tabs: myTabs,
          ),
          LayoutBuilder(builder: (context, constrains) {

            return AnimatedContainer(
              duration: Duration(
                seconds: 1,
              ),
              color: Colors.primaries[index],
              child: NotificationListener<LayoutChangedNotification>(
                onNotification: (notification) {
                  if (mounted) {
                    var size = context.findRenderObject()?.paintBounds.size;
                    print(size.toString());
                  }
                  return false;
                },
                child: SizeChangedLayoutNotifier(
                  child: SizedBox(height: 20.0 * index),
                ),
              ),
            );
          }),
          // AnimatedContainer(
          //   duration: Duration(seconds: 1),
          //   child: [
          //     Text('first tab'),
          //     Column(
          //       key: ValueKey('second tab'),
          //       children: [
          //         Text('second tab'),
          //         ...List.generate(10, (index) => Text('line: $index'))
          //       ],
          //     ),
          //     Column(
          //       key: ValueKey('third tab'),
          //       children: [
          //         Text('third tab'),
          //         ...List.generate(20, (index) => Text('line: $index'))
          //       ],
          //     ),
          //   ][_tabController.index],
          // ),
          _listItem(),
          _listItem(),
        ],
      ),
    );
  }

  getSwitcher() => AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: [
          Text('first tab'),
          Column(
            key: ValueKey('second tab'),
            children: [
              Text('second tab'),
              ...List.generate(10, (index) => Text('line: $index'))
            ],
          ),
          Column(
            key: ValueKey('third tab'),
            children: [
              Text('third tab'),
              ...List.generate(20, (index) => Text('line: $index'))
            ],
          ),
        ][_tabController.index],
        transitionBuilder: (Widget child, Animation<double> value) {
          print("动画 value = ${value.value}");
          var tween = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1));
          return SlideTransition(
            child: child,
            position: tween.animate(value),
          );
        },
      );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget successWidget = Container(
  alignment: Alignment.center,
  child: Text('我是Normal'),
);

Widget loadingWidget = Container(
  alignment: Alignment.center,
  child: CircularProgressIndicator(),
);

Widget errPage = Container(
  alignment: Alignment.center,
  child: Text('我是错误页'),
);
