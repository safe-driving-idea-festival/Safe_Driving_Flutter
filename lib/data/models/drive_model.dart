class DriveStartModel {
  final int driveId;

  DriveStartModel({required this.driveId});

  factory DriveStartModel.fromJson(Map<String, dynamic> json) {
    return DriveStartModel(driveId: json['driveId']);
  }
}
class DriveStopModel {
  final int detectionCount;
  final DriveStopInfoModel driveStopInfoModel;

  DriveStopModel({
    required this.detectionCount,
    required this.driveStopInfoModel,
  });

  // Factory method for JSON parsing
  factory DriveStopModel.fromJson(Map<String, dynamic> json) {
    return DriveStopModel(
      detectionCount: json['detectionCount'],
      driveStopInfoModel: DriveStopInfoModel.fromJson(json['detectionInfo']),
    );
  }
}

class DriveStopInfoModel {
  final int exit;
  final int almostSleep;
  final int sleeping;

  DriveStopInfoModel({
    required this.exit,
    required this.almostSleep,
    required this.sleeping,
  });

  factory DriveStopInfoModel.fromJson(Map<String, dynamic> json) {
    return DriveStopInfoModel(
      exit: json['exit'],
      almostSleep: json['almostSleep'],
      sleeping: json['sleeping'],
    );
  }
}