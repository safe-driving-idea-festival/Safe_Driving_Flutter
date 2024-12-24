import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:safe_driving/data/models/auth_model.dart';
import 'package:safe_driving/data/models/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel?> user(LoginResponseModel loginResponseModel);
}

class ProfileRepositoryImpl implements ProfileRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_URL'].toString(),
    ),
  );

  @override
  Future<ProfileModel?> user(
      LoginResponseModel loginResponseModel) async {
    try {
      final response = await _dio.get(
        '/user',
        options:
            Options(headers: {'Authorization': loginResponseModel.accessToken}),
      );
      return ProfileModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e.response?.data);
      return null;
    }
  }
}
