import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<testImutableState> buildReducer() {
  return asReducer(
    <Object, Reducer<testImutableState>>{
      testImutableAction.action: _onAction,
    },
  );
}

testImutableState _onAction(testImutableState state, Action action) {
  final testImutableState newState = state.clone();
  return newState;
}
