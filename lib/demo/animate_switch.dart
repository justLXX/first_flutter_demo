import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedSwitchDemo extends StatefulWidget {
  const AnimatedSwitchDemo({Key key}) : super(key: key);

  @override
  _AnimatedSwitchDemoState createState() => _AnimatedSwitchDemoState();
}

class _AnimatedSwitchDemoState extends State<AnimatedSwitchDemo> {
  bool _loading = false;

  @override
  void didUpdateWidget(covariant AnimatedSwitchDemo oldWidget) {
    _loading = true;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          _loading = !_loading;
        });
      },
      child: Container(
        constraints: BoxConstraints.tightFor(),
        child: AnimatedSwitcher(
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: child,
            );
            // return ScaleTransition(
            //   scale: animation,
            //   child: child,
            // );
          },
          duration: Duration(seconds: 2),
          child: _loading
              ? CircularProgressIndicator()
              : Image.network(
                  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F004%2F531%2F381%2F4339f96900344574a0c8ca272a7b8f27.jpg&refer=http%3A%2F%2Fyouimg1.c-ctrip.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626188476&t=ff7ad0bcd456a19456d0f7010a3f7063'),
        ),
      ),
    );
  }
}
