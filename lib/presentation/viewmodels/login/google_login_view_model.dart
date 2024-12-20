import 'package:flutter/material.dart';
import 'package:safe_driving/data/models/google_login_model.dart';
import 'package:safe_driving/data/repositories/google_login_repository.dart';


class GoogleLoginViewModel with ChangeNotifier {
  final GoogleLoginRepository _authRepository;
  GoogleLoginViewModel(this._authRepository);

  GoogleLoginModel? _user;
  bool _isLoading = false;

  GoogleLoginModel? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> signInWithGoogle() async {
    _isLoading = true;
    notifyListeners();
    final user = await _authRepository.signInWithGoogle();
    if (user != null) {
      _user = user;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    _user = null;
    notifyListeners();
  }
}