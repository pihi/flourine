import 'dart:async';

import 'package:flutter/services.dart';

class GooglePlayGameServices {
  static const MethodChannel _channel =
      const MethodChannel('flourine.pihimedia.com/google_play_game_services');

  final _MethodCallController _controller = new _MethodCallController(_channel);

  Future<void> unlockAchievement(String id) async {
    print("invoke method achievements.unlock on _channel");
    try {
      await _channel.invokeMethod(
          "achievements.unlock", <String, dynamic>{"id": id});
      print("invoke method returned");
    } catch (e) {
      print("error: $e");
    }
  }
}

class _MethodCallController {
  _MethodCallController(this._channel);

  final MethodChannel _channel;
  Completer<dynamic> _lastCompleter;

  Future<T> addMethodCall<T>(String client, String method, Map<String, dynamic> params) {
    print("calling $client.$method");

    if (_lastCompleter == null) {
      print("_lastCompleter null, invoking immediately");
      _lastCompleter = new Completer<dynamic>()
          ..complete(_channel.invokeMethod("$client.$method", params));
      print("invoking method $client.$method on _channel $_channel with $params");
      return _lastCompleter.future;
    }

    print("_lastCompleter already set, invoking when complete");
    final Completer<dynamic> completer = new Completer<dynamic>();
    _lastCompleter.future.whenComplete(() {
      completer.complete(_channel.invokeMethod("$client.$method", params));
      print("invoking method $client.$method on _channel $_channel with $params");
    });
    _lastCompleter = completer;
    return _lastCompleter.future;
  }
}