/// The current time. Injected so tests never read the real clock.
abstract interface class Clock {
  /// The phone's local wall-clock time.
  DateTime now();
}

class SystemClock implements Clock {
  const SystemClock();

  @override
  DateTime now() => DateTime.now();
}
