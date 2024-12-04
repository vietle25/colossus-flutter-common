import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/utils/log/log_mixin.dart';

abstract class CommonCubit<State> extends Cubit<State> with LogMixin {
  CommonCubit(super.initialState);

  @override
  void onChange(Change<State> change) {
    logD('Current State: ${change.currentState} => Next State: ${change.nextState}');
    super.onChange(change);
  }
}
