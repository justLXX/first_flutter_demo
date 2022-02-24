import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomLayout extends StatelessWidget {
  const MyCustomLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.blue[200],
        child: CustomMultiChildLayout(
          delegate: MyDelegate(Size(300, 400)),
          children: [
            LayoutId(
                id: 1,
                child: FlutterLogo(
                  size: 200,
                )),
            LayoutId(
                id: 2,
                child: FlutterLogo(
                  size: 200,
                )),
          ],
        ),
      ),
    );
    return Container();
  }
}

class MyDelegate extends MultiChildLayoutDelegate {
  final Size size;

  MyDelegate(this.size);

  double topDistance = 50;

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(200,200);
    return super.getSize(constraints);
  }

  @override
  void performLayout(Size size) {
    print('size = $size');
    if (hasChild(1)) {
      layoutChild(1, BoxConstraints.loose(size));
      positionChild(1, Offset.zero+Offset(0, topDistance));
    }

    if (hasChild(2)) {
      final size2 = layoutChild(2, BoxConstraints.loose(size));
      positionChild(2, size - size2 as Offset);
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}

buildSingleChildWidget() => Container(
  child: CustomSingleChildLayout(delegate: MySingleDelegate(),child: Container(color: Colors.red,),),
);


class MySingleDelegate extends SingleChildLayoutDelegate{
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) =>true;

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final dSize = size-childSize;
    return dSize as Offset;
  }

}