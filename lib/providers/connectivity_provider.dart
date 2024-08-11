import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier {
  static final ConnectivityProvider _instance =
      ConnectivityProvider._internal();

  ConnectivityProvider._internal() {
    _initConnectivity();
    _listenConnectivityChanges();
  }

  factory ConnectivityProvider() {
    return _instance;
  }

  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  ConnectivityResult get connectivityResult => _connectivityResult;

  void _initConnectivity() async {
    List<ConnectivityResult> connection =
        await Connectivity().checkConnectivity();
    if (connection.isNotEmpty) {
      _updateConnectivityState(connection[0]);
    }
  }

  void _listenConnectivityChanges() {
    Connectivity().onConnectivityChanged.listen((result) {
      if (result.isNotEmpty) {
        _updateConnectivityState(result[0]);
      }
    });
  }

  void _updateConnectivityState(ConnectivityResult connection) {
    if (_connectivityResult != connection) {
      _connectivityResult = connection;
      notifyListeners();
    }
  }
}
