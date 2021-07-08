import 'package:fish_redux/fish_redux.dart';

class SubState implements Cloneable<SubState> {

  @override
  SubState clone() {
    return SubState();
  }
}

SubState initState(Map<String, dynamic> args) {
  return SubState();
}
