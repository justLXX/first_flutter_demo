import 'package:fish_redux/fish_redux.dart';

class FirstState implements Cloneable<FirstState> {
  int count = 0;

  @override
  FirstState clone() {
    return FirstState()..count = count;
  }
}

FirstState initState(Map<String, dynamic> args) {
  return FirstState();
}
