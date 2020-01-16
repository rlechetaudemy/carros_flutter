import 'package:provider/provider.dart';

import 'simple_bloc.dart';

class EventBus extends SimpleBloc<String> {

  static EventBus get(context) => Provider.of<EventBus>(context, listen: false);

  sendEvent(String event) {
    add(event);
  }
}