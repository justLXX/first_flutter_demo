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



class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarDemo();
  }
}

class TabBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabBar();
}

class _TabBar extends State<TabBarDemo> {
  final List<String> _tabValues = [
    '语文',
    '英语',
    '化学',
    '物理',
    '数学',
    '生物',
    '体育',
    '经济',
  ];

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
      ),
      body: Column(
        children: [
          TabBar(
            tabs: _tabValues.map((f) {
              return Text(f);
            }).toList(),
            controller: _controller,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorWeight: 5.0,
            labelStyle: TextStyle(height: 2),
          ),
          LayoutBuilder(builder: (context, constrains) {
            return TabBarView(
                controller: _controller,
                children: List.generate(
                    _tabValues.length,
                    (index) => LayoutBuilder(builder: (context, constrains) {
                          print(constrains);
                          return Container(
                            height: 1000 / (index + 1),
                            color: Colors.primaries[index],
                            child: Center(
                              child: Text(_tabValues[index]),
                            ),
                          );
                        })));
          }),
        ],
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  final List<Widget> myTabs = [
    Tab(text: 'one'),
    Tab(text: 'two'),
    Tab(text: 'three'),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _listItem(),
          TabBar(
            controller: _tabController,
            labelColor: Colors.redAccent,
            tabs: myTabs,
          ),
          Center(
            child: [
              Text('first tab'),
              Column(
                children: [
                  Text('second tab'),
                  ...List.generate(10, (index) => Text('line: $index'))
                ],
              ),
              Column(
                children: [
                  Text('third tab'),
                  ...List.generate(20, (index) => Text('line: $index'))
                ],
              ),
            ][_tabController.index],
          ),
          _listItem(),
          _listItem(),
        ],
      ),
    );
  }
}


// getBody() {
//   return DefaultTextStyle(
//     style: TextStyle(
//       fontSize: 20,
//     ),
//     child: PageContainer(
//       title: Container(
//         height: 44,
//         color: Colors.blue,
//         child: Center(child: Text('标题')),
//       ),
//       status: PageStatus.FLOATING_LOADING,
//       success: successWidget,
//       // loading: loadingWidget,
//       // err: errPage,
//     ),
//   );
// }

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
