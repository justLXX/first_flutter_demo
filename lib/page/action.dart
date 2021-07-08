import 'package:fish_redux/fish_redux.dart';

enum FirstAction { onIncrease, notifyDataChange }

class FirstActionCreator {
  static Action onIncrease() {
    return const Action(FirstAction.onIncrease);
  }

  static Action notifyDataChange(int count) {
    return Action(FirstAction.notifyDataChange, payload: count);
  }
}
