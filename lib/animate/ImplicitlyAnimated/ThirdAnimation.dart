import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///更多动画控件 和曲线
class ThirdAnimation extends StatefulWidget {
  final String title = "Second";

  const ThirdAnimation({Key key}) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<ThirdAnimation> {
  bool _loading = true;

  double _paddingTop = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: AnimatedContainer(
          curve: Curves.bounceOut,
          margin: EdgeInsets.only(top: _paddingTop),
          duration: Duration(milliseconds: 300),
          color: Colors.blue,
          height: 100,
          width: 100,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _loading = !_loading;
              });
            },
            child: AnimatedSwitcher(
              duration: Duration(seconds: 2),
              child: _loading
                  ? Center(child: CircularProgressIndicator())
                  : Image.network(
                      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F004%2F531%2F381%2F4339f96900344574a0c8ca272a7b8f27.jpg&refer=http%3A%2F%2Fyouimg1.c-ctrip.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626188476&t=ff7ad0bcd456a19456d0f7010a3f7063',
                      width: 300,
                    ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _paddingTop += 100;
            if (_paddingTop > 500) {
              _paddingTop = 0;
            }
          });
        },
        child: Icon(Icons.add_to_queue),
      ),
    );
  }
}
