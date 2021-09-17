import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TinyTagPage extends StatelessWidget {
  TinyTagPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('紧贴 TAG'),
      ),
      body: Container(
        color: Colors.lightGreen,
        child: Column(
          children: [
            Positioned(
              top: 100,
              child: Wrap(
                children: [
                  Container(
                    color: Colors.white,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    // width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.yellow)),
                    // height: 200,
                    child: Text(
                      '经纪人/公寓',
                      style:
                          TextStyle(color: Colors.red, fontSize: 30, height: 1),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),

                  Container(
                    // width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.yellow)),
                    // height: 200,
                    child: Text(
                      '经纪人',
                      style:
                      TextStyle(color: Colors.red, fontSize: 30, height: 1),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      // color: HouseColors.parseColor(state.companyTag.bgColor),
                        borderRadius: BorderRadius.all(Radius.circular(1)),
                        border: Border.all(color: Colors.yellow, width: 2)),

                    child: Text(
                      '经纪人',
                      style: TextStyle(
                        fontSize: 30,
                        height: 1,
                        color: Colors.black45,
                      ),
                    ),

                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TinyTagWidget extends SingleChildRenderObjectWidget {
  const TinyTagWidget({Key key, Widget child}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderTinyTag();
  }
}

class RenderTinyTag extends RenderProxyBox {
  @override
  void performLayout() {
    super.performLayout();
    // TextPainter painter = new TextPainter(text: TextSpan(text: '经济人/公寓'));
    // List<LineMetrics> lines = painter.computeLineMetrics();
    // painter.layout()
  }

  void paint(PaintingContext context, Offset offset) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    context.canvas.drawRRect(
        RRect.fromRectAndRadius(offset & size, Radius.circular(10)), paint);

    super.paint(context, offset);

    if (child is RenderParagraph) {
      // final paint = child.painte
      // computeLineMetrics
    }
  }
}

class TinyTagWidget1 extends StatelessWidget {
  final String text;

  final TextStyle textStyle;

  GlobalKey globalKey = GlobalKey();

  TinyTagWidget1({Key key, this.text, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding.top;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final span = TextSpan(text: text, style: textStyle);
        final tp = TextPainter(
            text: span, maxLines: 5, textDirection: TextDirection.ltr);
        tp.layout(maxWidth: constraints.maxWidth);
        List<LineMetrics> lines = tp.computeLineMetrics();

        LineMetrics metrics = lines.first;

        TextRange rang = tp.getWordBoundary(TextPosition(offset: 0));

        double actualBaseLine =
            tp.computeDistanceToActualBaseline(TextBaseline.ideographic);
        print('rang = $rang    padding ${padding}');
        print('lines = $lines   ');
        print('actualBaseLine = $actualBaseLine   ');
        print('constraints = $constraints');
        return GestureDetector(
          onTap: () {
            final graph = (globalKey.currentContext.findRenderObject()
                as RenderParagraph);

            print('graph size = ${graph.size}   ');

            print('graph local = ${graph.localToGlobal(Offset.zero)}');

            ;
          },
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  left: metrics.left,
                  top: metrics.descent / 3,
                  child: Container(
                    width: metrics.width,
                    height: metrics.baseline +
                        (metrics.height - metrics.baseline) / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.red)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Text(
                    text,
                    key: globalKey,
                    style: textStyle,
                  ),
                ),
                Positioned(
                  top: metrics.height,
                  child: Container(
                    color: Colors.black,
                    width: 300,
                    height: 4,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//
// class TinyPainter extends CustomPainter{
//
//   final TextSpan span;
//
//   TinyPainter(this.span);
//
//   BoxDecoration decoration;
//
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     TextPainter painter = new TextPainter(text: TextSpan(text: '经济人/公寓'));
//     List<LineMetrics> lines = painter.computeLineMetrics();
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return this.span!=(oldDelegate as TinyPainter).span;
//   }
//
// }
