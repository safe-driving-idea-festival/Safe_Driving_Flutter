import 'package:flutter/material.dart';
import 'package:safe_driving/data/models/google_login_model.dart';
import 'package:safe_driving/data/models/auth_model.dart';
import 'package:safe_driving/data/repositories/google_login_repository.dart';
import 'package:safe_driving/data/repositories/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final GoogleLoginRepository _googleRepository;
  final AuthRepository _authRepository;

  AuthViewModel(
    this._googleRepository,
    this._authRepository,
  );

  GoogleLoginModel? _google;
  String _authorization = '';
  final _nameController = TextEditingController();
  final _camIdController = TextEditingController();
  final _emergencyNumbersController = TextEditingController();
  final List<String> _emergencyNumber = [];

  GoogleLoginModel? get google => _google;

  String get authorization => _authorization;

  TextEditingController get nameController => _nameController;

  TextEditingController get camIdController => _camIdController;

  TextEditingController get emergencyNumbersController =>
      _emergencyNumbersController;

  List get emergencyNumber => _emergencyNumber;

  Future<bool> signInWithGoogle() async {
    final google = await _googleRepository.signInWithGoogle();
    if (google != null) {
      _google = google;
      _login();
      return false;
    }
    return false;
  }

  Future<bool> signUp() async {
    final signup = await _authRepository.signUp(
      SignupRequestModel(
        accessToken: _google!.accesstoken,
        name: _nameController.text,
        camId: _camIdController.text,
        emergencyNumbers: _emergencyNumber,
      ),
    );
    if (signup) {
      _login();
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> _login() async {
    final login = await _authRepository.login(
      LoginRequestModel(accessToken: _google!.accesstoken),
    );
    if (login != null) {
      _authorization = login.authorization;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> signOut() async {
    await _googleRepository.signOut();
    _google = null;
    notifyListeners();
  }

  void addEmergencyNumber() {
    if (_emergencyNumbersController.text != '') {
      _emergencyNumber.add(_emergencyNumbersController.text);
      _emergencyNumbersController.clear();
    }
    notifyListeners();
  }

  void removeEmergencyNumber(int value) {
    _emergencyNumber.removeAt(value);
    notifyListeners();
  }
}
