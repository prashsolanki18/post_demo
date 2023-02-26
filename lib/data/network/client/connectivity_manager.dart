import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Used to check internet connectivity
class ConnectivityManager {
  static final ConnectivityManager _singleton = ConnectivityManager._internal();

  factory ConnectivityManager({Function(bool isConnected)? callback}) {
    if (callback != null) {
      _singleton.connectionCallback = callback;
    }
    return _singleton;
  }

  ConnectivityManager._internal();

  final Connectivity _connectivity = Connectivity();

  Stream<ConnectivityResult> get connectivitySubscription => _connectivity.onConnectivityChanged;
  Function(bool isConnected)? connectionCallback;
  RxBool isNetConnected = false.obs;

  Future<bool> checkInternet() async {
    try {
      var result = await _connectivity.checkConnectivity();
      return result == ConnectivityResult.wifi || result == ConnectivityResult.mobile;
    } on PlatformException catch (e) {
      debugPrint('Could not check connectivity status: $e');
      return false;
    }
  }

  void setConnectivityListener() {
    connectivitySubscription.listen((event) {
      isNetConnected.value = event.name != 'none';
      connectionCallback?.call(isNetConnected.value);
    });
  }
}
