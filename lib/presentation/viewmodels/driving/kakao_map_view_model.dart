import 'package:flutter/cupertino.dart';
import 'package:safe_driving/data/models/kakao_map_model.dart';
import 'package:safe_driving/data/models/location_model.dart';
import 'package:safe_driving/data/repositories/kakao_map_repository.dart';

class KakaoViewModel extends ChangeNotifier {
  KakaoMapModel? _kakaoMapModel;
  final KakaoMapRepository _kakaoMapRepository;

  KakaoViewModel(this._kakaoMapRepository);

  KakaoMapModel? get kakaoMapModel => _kakaoMapModel;

  Future<void> getLocation(LocationModel location) async {
    _kakaoMapModel = await _kakaoMapRepository.search(location);
    print(_kakaoMapModel!.placeName);
    notifyListeners();
  }
}
