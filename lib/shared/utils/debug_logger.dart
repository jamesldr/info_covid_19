import 'dart:developer';

class DebugLogger {
  DebugLogger();
  call(message) {
    log(message.toString());
  }
}
