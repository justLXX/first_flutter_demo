import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstAnimatePage extends StatefulWidget {
  FirstAnimatePage({Key key}) : super(key: key);

  final String title = "FirstAnimatePage";

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstAnimatePage> {
  int _counter = 0;

  double _basic = 0.1;

  void _incrementCounter() {
    setState(() {
      _basic += 0.1;
      if (_basic > 1) {
        _basic = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.red, Colors.white],
                  stops: [_basic, _basic + 0.2]),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 25,
                  blurRadius: 25,
                )
              ],
              borderRadius: BorderRadius.circular(200)),
          child: Center(
            child: Text(
              'Hi',
              style: TextStyle(fontSize: 70),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.adb),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
