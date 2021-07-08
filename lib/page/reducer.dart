import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FirstState> buildReducer() {
  return asReducer(
    <Object, Reducer<FirstState>>{
      FirstAction.notifyDataChange: _notifyDataChange,
    },
  );
}

FirstState _notifyDataChange(FirstState state, Action action) {
  print('_notifyDataChange   oldState = $state   count = ${action.payload}');
  final FirstState newState = state.clone()..count = action.payload;
  return newState;
}
