import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum testImutableAction { action }

class testImutableActionCreator {
  static Action onAction() {
    return const Action(testImutableAction.action);
  }
}
