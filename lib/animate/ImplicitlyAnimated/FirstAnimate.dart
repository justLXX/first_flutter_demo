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

  double _height = 300;

  void _incrementCounter() {
    setState(() {
      _height += 100;
      if (_height > 600) _height = 100;
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
          duration: Duration(milliseconds: 500),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.red, Colors.white],
                  stops: [0.4,0.6]
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 25,
                  blurRadius: 25,
                )
              ],
              borderRadius: BorderRadius.circular(150)

          ),
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
