class KakaoMapModel {
  final String placeName;
  final String addressName;
  final String x;
  final String y;
  final String distance;

  KakaoMapModel({
    required this.placeName,
    required this.addressName,
    required this.x,
    required this.y,
    required this.distance,
  });

  factory KakaoMapModel.fromJson(Map<String, dynamic> json) => KakaoMapModel(
        placeName: json['place_name'],
        addressName: json['address_name'],
        x: json['x'],
        y: json['y'],
        distance: json['distance'],
      );
}
