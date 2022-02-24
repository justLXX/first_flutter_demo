import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class AnimationItem {
  final String name;
  final String path;

  AnimationItem(this.name, this.path);
}

class AnimatedDemo extends StatelessWidget {
  const AnimatedDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: animateRoutes.entries
              .map((entry) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, entry.key);
                    },
                    child: Container(
                      width: double.infinity,
                      color: Theme.of(context).primaryColorDark,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: Center(
                          child: Text(
                        entry.key,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
