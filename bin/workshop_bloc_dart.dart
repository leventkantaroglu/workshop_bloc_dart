import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(int initialState) : super(initialState);

  void increment() {
    //addError(Exception('increment error!'), StackTrace.current);
    emit(state + 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}

Future<void> main() async {
  /* BlocOverrides.runZoned(
    () {
      CounterCubit(0)
        ..increment()
        ..close();
    },
    blocObserver: SimpleBlocObserver(),
  ); */
  final cubit = CounterCubit(0);
  final subscription = cubit.stream.listen(print); // 1
  cubit.increment();
  await Future.delayed(Duration(seconds: 3));
  cubit.increment();
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await cubit.close();
}
