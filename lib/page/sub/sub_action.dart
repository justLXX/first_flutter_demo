import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SubAction { action }

class SubActionCreator {
  static Action onAction() {
    return const Action(SubAction.action);
  }
}
