// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:first_flutter_demo/main.dart';

void main() {

  var list = [1,2,3,4];

  list.forEach((element) async{
    await Future.delayed(Duration(seconds: 1));
    print('我是 $element');
  });


  test('description', () => {


    print('description')


  });
}
