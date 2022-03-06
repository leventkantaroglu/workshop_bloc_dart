import 'package:bloc/bloc.dart';

import 'counter_event.dart';

class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(initialValue) : super(initialValue) {
    on<CounterIncrementPressed>((event, emit) {
      emit(state + 1);
    });
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    print(event);
  }
}
