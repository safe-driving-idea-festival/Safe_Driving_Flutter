import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:safe_driving/data/models/auth_model.dart';
import 'package:safe_driving/data/models/drive_model.dart';

abstract class DriveRepository {
  Future<DriveStartModel?> start(LoginResponseModel loginResponseModel);

  Future<DriveStopModel?> stop(LoginResponseModel loginResponseModel);
}

class DriveRepositoryImpl implements DriveRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_URL'].toString(),
    ),
  );

  @override
  Future<DriveStartModel?> start(LoginResponseModel loginResponseModel) async {
    try {
      final response = await _dio.post(
        '/drive/start',
        options:
            Options(headers: {'Authorization': loginResponseModel.accessToken}),
      );
      return DriveStartModel.fromJson(response.data);
    } on DioException{
      return null;
    }
  }

  @override
  Future<DriveStopModel?> stop(LoginResponseModel loginResponseModel) async {
    try {
      final response = await _dio.post(
        '/drive/end',
        options:
            Options(headers: {'Authorization': loginResponseModel.accessToken}),
      );
      return DriveStopModel.fromJson(response.data);
    } on DioException {
      return null;
    }
  }
}
