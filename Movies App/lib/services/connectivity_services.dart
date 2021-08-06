import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';

enum ConnectivityStatus { wifi, cellular, offline }

class ConnectivityService {
  static ConnectivityService? _singleton;

  final StreamController<ConnectivityStatus> _controller =
      StreamController<ConnectivityStatus>.broadcast();

  StreamSubscription? _subscription;
  ConnectivityStatus _status = ConnectivityStatus.cellular;
  bool get isOffline => ConnectivityStatus.offline == _status;
  Stream<ConnectivityStatus> get changes => _controller.stream;

  bool _hasConnection = true;
  bool _disposed = false;

  factory ConnectivityService() {
    if (_singleton == null || _singleton!._disposed) {
      _singleton = ConnectivityService._internal();
    } else {
      _singleton!.update();
    }

    return _singleton!;
  }

  ConnectivityService._internal() {
    Connectivity().checkConnectivity().then((result) {
      _handle(result);
    });
    _subscription = Connectivity().onConnectivityChanged.listen(_handle);
  }

  Future<ConnectivityStatus> _handle(ConnectivityResult result) async {
    test();
    final previousStatus = _status;
    _status = _getStatusFromResult(result);
    if (previousStatus != _status) {
      _controller.add(_status);
    }

    return _status;
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    if (_hasConnection) {
      switch (result) {
        case ConnectivityResult.mobile:
          return ConnectivityStatus.cellular;
        case ConnectivityResult.wifi:
          return ConnectivityStatus.wifi;
        case ConnectivityResult.none:
        default:
          break;
      }
    }

    return ConnectivityStatus.offline;
  }

  Future<ConnectivityStatus> update() =>
      Connectivity().checkConnectivity().then(_handle);

  void test() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      _hasConnection = true;
    } else {
      _hasConnection = false;
    }
  }

  static bool disableCheckConnectivity = false;

  static Future<bool> isConnected() async {
    var result = !disableCheckConnectivity
        ? await Connectivity().checkConnectivity()
        : ConnectivityResult.wifi;

    return (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile);
  }

  void dispose() {
    _disposed = true;
    _controller.close();
    _subscription?.cancel();
  }
}
