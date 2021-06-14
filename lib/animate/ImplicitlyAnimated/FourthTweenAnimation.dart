import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///tweenAnimtion
class FourthTweenAnimation extends StatefulWidget {
  final String title = "Second";

  const FourthTweenAnimation({Key key}) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<FourthTweenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(seconds: 1),
          tween: Tween(begin: 0.00, end: 1.0),
          builder: (BuildContext context, value, Widget child) {
            return Opacity(
              opacity: value,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                color: Colors.blue,
                width: 300,
                height: 300,
                // child: Center(child: CircularProgressIndicator()),
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 2),
                  // child: Center(child: CircularProgressIndicator()),
                  // child: Image.network(
                  //     'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F004%2F531%2F381%2F4339f96900344574a0c8ca272a7b8f27.jpg&refer=http%3A%2F%2Fyouimg1.c-ctrip.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626188476&t=ff7ad0bcd456a19456d0f7010a3f7063'),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPress(),
        child: Icon(Icons.add_to_queue),
      ),
    );
  }

  _onPress() {}
}
