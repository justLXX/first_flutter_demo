

import 'package:flutter/material.dart';

class Layout2 extends StatelessWidget {
  const Layout2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height:300,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white,Colors.green]
          )
      ),
      child: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: SizedBox(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 200,height: 200),
            child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              print("$constraints");
              return FlutterLogo(size: 20,);
            },),
          ),
        ),
      ),
    );
  }
}
