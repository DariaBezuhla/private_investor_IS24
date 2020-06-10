import 'dart:core';

/**
 * This class represents as City, Country, Quarters and Postcode.
 * In general, it is a superclass of the json subtypes from the response body!
 */
class Location {
  String geoId;
  String type;
  String label;
  String geoPath;

  Location({this.geoId, this.type, this.label, this.geoPath});

  factory Location.fromJson(dynamic json) {
    return Location(
      geoId: json['geoId'],
      type: json['type'],
      label: json['label'],
      geoPath: json['geoPath'],
    );
  }

  String getGeoId() {
    return geoId;
  }

  String getType() {
    return type;
  }

  String getLabel() {
    return label;
  }

  String getGeoPath() {
    return geoPath;
  }

  @override
  String toString() {
    return geoId + '' + type + '' + label + '' + geoPath;
  }
}
