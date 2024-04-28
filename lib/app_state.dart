import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _isPasswardMissmatch = false;
  bool get isPasswardMissmatch => _isPasswardMissmatch;
  set isPasswardMissmatch(bool value) {
    _isPasswardMissmatch = value;
  }

  String _ProfilePicture = '';
  String get ProfilePicture => _ProfilePicture;
  set ProfilePicture(String value) {
    _ProfilePicture = value;
  }

  String _UserName = '';
  String get UserName => _UserName;
  set UserName(String value) {
    _UserName = value;
  }

  String _UserEmail = '';
  String get UserEmail => _UserEmail;
  set UserEmail(String value) {
    _UserEmail = value;
  }

  String _isSent = '';
  String get isSent => _isSent;
  set isSent(String value) {
    _isSent = value;
  }
}
