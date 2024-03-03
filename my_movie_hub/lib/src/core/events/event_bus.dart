import 'package:event_bus/event_bus.dart';

abstract class IEventBus {
  void emitEvent(dynamic event);
  Stream<T> on<T>();
  void off(dynamic eventType);
}

class EventBusFacade implements IEventBus {
  final EventBus _eventBus = EventBus();

  @override
  void emitEvent(dynamic event) {
    _eventBus.fire(event);
  }

  @override
  Stream<T> on<T>() {
    return _eventBus.on<T>();
  }

  @override
  void off(dynamic eventType) {}
}
