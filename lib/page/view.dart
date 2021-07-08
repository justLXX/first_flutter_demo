import 'package:first_flutter_demo/page/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(FirstState state, Dispatch dispatch, ViewService viewService) {
  print('buildView   count = ${state.count}');

  return Scaffold(
    appBar: AppBar(
      title: Text('计数器'),
    ),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('You have push the button this many times: '),
          Text('${state.count}')
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        dispatch(FirstActionCreator.onIncrease());
      },
      child: Icon(Icons.add),
    ),
  );
}
