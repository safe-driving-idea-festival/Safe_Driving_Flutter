import 'package:flutter/widgets.dart';
import 'package:safe_driving/data/models/auth_model.dart';
import 'package:safe_driving/data/repositories/profile_repository.dart';
import '../../../data/models/profile_model.dart';

class ProfileViewModel with ChangeNotifier {
  final ProfileRepository _profileRepository;

  ProfileViewModel(this._profileRepository);

  ProfileModel? _profileModel;

  ProfileModel? get profileModel => _profileModel;

  void initProfile(LoginResponseModel loginResponseModel) async {
    _profileModel = await _profileRepository.user(loginResponseModel);
    notifyListeners();
  }
}
