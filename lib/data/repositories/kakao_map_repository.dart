import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:safe_driving/data/models/kakao_map_model.dart';
import 'package:safe_driving/data/models/location_model.dart';

abstract class KakaoMapRepository {
  Future<KakaoMapModel?> search(LocationModel location);
}

class KakaoMapRepositoryImpl implements KakaoMapRepository {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: 'https://dapi.kakao.com/v2/local/search/keyword',
        headers: {'Authorization': dotenv.env['KAKAO_TOKEN']}),
  );

  @override
  Future<KakaoMapModel?> search(LocationModel location) async {
    try {
      final response = await _dio.get('', queryParameters: {
        'x': location.x,
        'y': location.y,
        'radius': 20000,
        'query': '졸음쉼터'
      });
      return KakaoMapModel.fromJson(response.data['documents'][0]);
    } catch (e) {
      return null;
    }
  }
}
