import 'package:fish_redux/fish_redux.dart';

import 'sub_reducer.dart';
import 'sub_state.dart';
import 'sub_view.dart';

class SubComponent extends Component<SubState> {
  SubComponent()
      : super(
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SubState>(
                adapter: null,
                slots: <String, Dependent<SubState>>{
                }),);

}
