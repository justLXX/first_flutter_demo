import 'package:fish_redux/fish_redux.dart';

import 'sub_action.dart';
import 'sub_state.dart';

Reducer<SubState> buildReducer() {
  return asReducer(
    <Object, Reducer<SubState>>{
      SubAction.action: _onAction,
    },
  );
}

SubState _onAction(SubState state, Action action) {
  final SubState newState = state.clone();
  return newState;
}
