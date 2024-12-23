import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:safe_driving/data/models/auth_model.dart';

abstract class AuthRepository {
  Future<LoginResponseModel?> login(LoginRequestModel? loginRequestModel);

  Future<bool> signUp(SignupRequestModel? signupModel);
}

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_URL'].toString(),
    ),
  );

  @override
  Future<LoginResponseModel?> login(
      LoginRequestModel? loginRequestModel) async {
    try {
      final response = await _dio.post(
        '/user/login',
        data: jsonEncode(loginRequestModel!.toJson()),
      );
      return LoginResponseModel.fromJson(response.headers.map);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> signUp(SignupRequestModel? signupModel) async {
    final response = await _dio.post(
      '/user/signup',
      data: jsonEncode(signupModel!.toJson()),
    );
    try {
      print(response.data['message']);
      return true;
    } catch (e) {
      print(response.data['message']);
      return false;
    }
  }
}
