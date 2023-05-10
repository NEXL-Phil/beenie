import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _baseURL = prefs.getString('ff_baseURL') ?? _baseURL;
    _firstLogin = prefs.getBool('ff_firstLogin') ?? _firstLogin;
    _maincolorstate = _colorFromIntValue(prefs.getInt('ff_maincolorstate')) ??
        _maincolorstate;
    _useProfile = prefs.getBool('ff_useProfile') ?? _useProfile;
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

  Color _maincolorstate = Color(4278206930);
  Color get maincolorstate => _maincolorstate;
  set maincolorstate(Color _value) {
    _maincolorstate = _value;
    prefs.setString('ff_maincolorstate', _value.value.toString());
  }

  bool _useProfile = true;
  bool get useProfile => _useProfile;
  set useProfile(bool _value) {
    _useProfile = _value;
    prefs.setBool('ff_useProfile', _value);
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

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
