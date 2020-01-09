
import 'dart:async';

class SimpleBloc<T> {

  final _controller = StreamController<T>();

  Stream<T> get stream => _controller.stream;

  void add(T object) {
    if(! _controller.isClosed) {
      _controller.add(object);
    }
  }

  void addError(Object error) {
    if(! _controller.isClosed) {
      _controller.addError(error);
    }
  }

  void dispose() {
    _controller.close();
  }
}

class BooleanBloc extends SimpleBloc<bool> {

}