class LoginRequestModel {
  final String accessToken;

  LoginRequestModel({required this.accessToken});

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
    };
  }
}

class LoginResponseModel {
  final String authorization;

  LoginResponseModel({required this.authorization});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      authorization: json['authorization'][0],
    );
  }
}

class SignupRequestModel {
  final String accessToken;
  final String name;
  final String camId;
  final List<String> emergencyNumbers;

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
