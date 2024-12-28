abstract class LoginModel {}

class LoginRequestModel implements LoginModel {
  final String accessToken;
  final String deviceToken;

  LoginRequestModel({
    required this.accessToken,
    required this.deviceToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'deviceToken': deviceToken,
    };
  }
}

class LoginResponseModel implements LoginModel {
  final String authority;
  final String accessToken;

  LoginResponseModel({
    required this.authority,
    required this.accessToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      authority: json['authority'],
      accessToken: json['accessToken'],
    );
  }
}

abstract class SignupModel {}

class SignupRequestModel implements SignupModel {
  final String accessToken;
  final String name;
  final String camId;
  final List emergencyNumbers;

  SignupRequestModel({
    required this.accessToken,
    required this.name,
    required this.camId,
    required this.emergencyNumbers,
  });

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'name': name,
      'camId': camId,
      'emergencyNumbers': emergencyNumbers,
    };
  }
}

class SignupErrorModel implements SignupModel {
  final String message;

  SignupErrorModel({
    required this.message,
  });

  factory SignupErrorModel.fromJson(Map<String, dynamic> json) {
    return SignupErrorModel(message: json['message']);
  }
}
