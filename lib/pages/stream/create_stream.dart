import 'dart:async';

class Bloc {

  StreamController<int> _streamController = StreamController<int>();

  Stream<int> get stream => _streamController.stream;
  Sink<int> get sink => _streamController.sink;

  StreamController<int> get streamController => _streamController;

  Bloc() {
    sink.add(1);
  }

  dispose() {
    _streamController.close();
  }
}

final bloc = Bloc();