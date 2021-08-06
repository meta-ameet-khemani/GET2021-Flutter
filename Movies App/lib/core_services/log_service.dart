import 'package:logger/logger.dart';

abstract class ILog {
  log(dynamic msg, {dynamic error, StackTrace? stackTrace});
}

class Log implements ILog {
  late Logger _logger;

  static Log? _instance;

  static Log get instance => _instance ??= Log();

  static bool _disableConsoleLogging = false;

  Log() {
    _logger = Logger();
  }

  static set disableConsoleLogging(bool value) {
    _disableConsoleLogging = value;
  }

  @override
  log(dynamic msg, {dynamic error, StackTrace? stackTrace}) {
    if (_disableConsoleLogging) {
      return;
    }
    if (msg != null) {
      _logger.log(Level.verbose, msg);
    } else if (error != null) {
      _logger.log(Level.verbose, msg, error, stackTrace);
    }
  }
}
