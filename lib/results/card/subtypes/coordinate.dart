import 'dart:ffi';

class Coordinate {
  num longitude;
  num latitude;

  Coordinate({this.latitude, this.longitude});

  factory Coordinate.fromJson(dynamic json) {
    return Coordinate(
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
}