import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: TapBoxA(),
        ),
        decoration: BoxDecoration(color: Colors.redAccent),
      ),
    );
  }
}

class TapBoxA extends StatefulWidget {
   TapBoxA({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {

  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}
