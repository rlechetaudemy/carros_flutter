import 'package:provider/provider.dart';

import 'simple_bloc.dart';

class Event {

}

class EventBus extends SimpleBloc<Event> {

  static EventBus get(context) => Provider.of<EventBus>(context, listen: false);

  sendEvent(Event event) {
    add(event);
  }
}