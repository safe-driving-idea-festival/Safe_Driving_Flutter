class DriveInfo {
  final int exit;
  final int almostSleep;
  final int sleeping;

  DriveInfo({
    required this.exit,
    required this.almostSleep,
    required this.sleeping,
  });

  factory DriveInfo.fromJson(Map<String, dynamic> json) {
    return DriveInfo(
      exit: json['exit'],
      almostSleep: json['almostSleep'],
      sleeping: json['sleeping'],
    );
  }
}

class Drive {
  final String date;
  final int detectionCount;
  final DriveInfo detectionInfo;

  Drive({
    required this.date,
    required this.detectionCount,
    required this.detectionInfo,
  });

  factory Drive.fromJson(Map<String, dynamic> json) {
    return Drive(
      date: json['date'],
      detectionCount: json['detectionCount'],
      detectionInfo: DriveInfo.fromJson(json['detectionInfo']),
    );
  }
}

class ProfileModel {
  final String name;
  final String email;
  final int driveCount;
  final List<Drive> drives;

  ProfileModel({
    required this.name,
    required this.email,
    required this.driveCount,
    required this.drives,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      email: json['email'],
      driveCount: json['driveCount'],
      drives: (json['drives'] as List)
          .map((driveJson) => Drive.fromJson(driveJson))
          .toList(),
    );
  }
}
