import 'dart:async';

class CounterBloc {
  var tamp = 0;

  StreamController<int> streamController = StreamController<int>();
  Stream get counterStream => streamController.stream;

  onIncrement(int number) {
    tamp == 10 ? tamp = 10 :tamp += number;
    streamController.sink.add(tamp);
  }

  onDecrement(int number) {
    tamp == 0 ? tamp = 0 : tamp -= number;
    streamController.sink.add(tamp);
  }

  dispose() {
    streamController.close();
  }
}
