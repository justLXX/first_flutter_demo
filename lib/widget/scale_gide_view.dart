import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaleWidget extends StatefulWidget {
  const ScaleWidget({Key key}) : super(key: key);

  @override
  _ScaleWidgetState createState() => _ScaleWidgetState();
}

class _ScaleWidgetState extends State<ScaleWidget> {
  double maxCrossAxisExtent = 100;

  ScaleUpdateDetails lastDetail;

  double wid = 300;

  double scale = 1;

  @override
  Widget build(BuildContext context) {
    bool flag = false;

    return Container(
      child: flag ? Container() : Container(),
    );
    // return GestureDetector(
    //   onScaleUpdate: (detail) {
    //     setState(() {
    //       wid = detail.scale.clamp(0.991, 1.005) * wid;
    //       if (wid < 200) {
    //         wid = 200;
    //       }
    //       print('GestureDetector  wid  wid = ${wid}');
    //     });
    //   },
    //   child: Container(
    //     child: Center(
    //       child: Container(
    //         width: wid,
    //         height: wid,
    //         color: Colors.red,
    //       ),
    //     ),
    //     color: Colors.greenAccent,
    //   ),
    // );
    return GestureDetector(
      onScaleUpdate: (detail) {
        print('GestureDetector  scale  detail = ${detail.scale}');
        setState(() {
          scale = detail.scale.clamp(0.991, 1.005);
        });
      },
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            maxCrossAxisExtent: maxCrossAxisExtent),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onDoubleTap: () {
              setState(() {
                if (maxCrossAxisExtent == 100) {
                  maxCrossAxisExtent = 200;
                } else {
                  maxCrossAxisExtent = 100;
                }
              });
            },
            onScaleUpdate: (ScaleUpdateDetails details) {
              print('onScaleUpdate  scale = ${details.scale} ');

              // setState(() {
              //   maxCrossAxisExtent =
              //       maxCrossAxisExtent * details.scale.clamp(.8, 1.2);
              //   print('onScaleUpdate  maxCrossAxisExtent = $maxCrossAxisExtent ');
              // });

              lastDetail = details;
            },
            onScaleEnd: (ScaleEndDetails endDetails) {
              // setState(() {
              //   maxCrossAxisExtent =
              //       maxCrossAxisExtent * lastDetail.scale;
              //   print('onScaleEnd  maxCrossAxisExtent = $maxCrossAxisExtent ');
              // });
            },
            child: Container(
              color: Colors.primaries[index % Colors.primaries.length],
              child: ScaleTransition(
                scale: Tween(begin: 1.0, end: scale).animate(null),

                /// todo 如何获取 Animation
                child: Center(
                  child: Text('index = $index'),
                ),
              ),
            ),
          );
          print('child index = $index');
          return _getChild(index);
        },
      ),
    );
  }

  _getChild(int index) {
    GestureDetector(
      onScaleUpdate: (ScaleUpdateDetails details) {
        print('scale  details = $details');
        setState(() {
          maxCrossAxisExtent = maxCrossAxisExtent * details.scale.clamp(0.5, 2);
        });
      },
      child: Container(
        color: Colors.primaries[index % Colors.primaries.length],
      ),
    );
  }
}
