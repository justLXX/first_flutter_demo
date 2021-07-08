import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<FirstState> buildEffect() {
  return combineEffects(<Object, Effect<FirstState>>{
    FirstAction.onIncrease: _onIncrease,
  });
}

void _onIncrease(Action action, Context<FirstState> ctx) {
  int count = ctx.state.count + 1;
  print('_onIncrease   count = $count');
  ctx.dispatch(FirstActionCreator.notifyDataChange(count));
}
