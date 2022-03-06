import 'bloc.dart';

Future<void> main() async {
  var counterBloc = CounterBloc(0);
  print(counterBloc.state);
  counterBloc.add(CounterIncrementPressed());
  await Future.delayed(Duration.zero);
  print(counterBloc.state);
}
