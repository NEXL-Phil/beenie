import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _baseURL = prefs.getString('ff_baseURL') ?? _baseURL;
    _firstLogin = prefs.getBool('ff_firstLogin') ?? _firstLogin;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _viewAll = true;
  bool get viewAll => _viewAll;
  set viewAll(bool _value) {
    _viewAll = _value;
  }

  String _baseURL = 'https://beenie.nexl.cloud/';
  String get baseURL => _baseURL;
  set baseURL(String _value) {
    _baseURL = _value;
    prefs.setString('ff_baseURL', _value);
  }

  bool _reSent = false;
  bool get reSent => _reSent;
  set reSent(bool _value) {
    _reSent = _value;
  }

  bool _firstLogin = true;
  bool get firstLogin => _firstLogin;
  set firstLogin(bool _value) {
    _firstLogin = _value;
    prefs.setBool('ff_firstLogin', _value);
  }

  String _tempEmail = '';
  String get tempEmail => _tempEmail;
  set tempEmail(String _value) {
    _tempEmail = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
