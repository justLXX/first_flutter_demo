
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animate/ImplicitlyAnimated/FirstAnimate.dart';
import 'animate/ImplicitlyAnimated/FiveAnimation.dart';
import 'animate/ImplicitlyAnimated/FourthTweenAnimation.dart';
import 'animate/ImplicitlyAnimated/SecondAnite.dart';
import 'animate/ImplicitlyAnimated/ThirdAnimation.dart';
import 'animate/transation/FirstTransation.dart';

void main() {
  runApp(MyApp());
  // var foo = Foo(5);
  // foo.foo(null);
}

class MyApp extends StatelessWidget {
  final String title;

  MyApp({Key key, this.title}) : super(key: key) {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home: FirstAnimatePage(),
      home: FirstTransition(),
    );
  }
}


class Foo {
  String name;

  final int age;

  // Foo(this.name);

  Foo(this.age) {
    this.name = age.toString();
  }

  void foo(Bar bar) {
    print("I'm Foo name = $name  age = $age");
    var bar = Bar(this);
    bar.printBar();
  }
}

class Bar {
  final Foo foo;

  Bar(this.foo);

  void printBar() {
    print("I am Bar  my  foo = $foo");
  }
}
