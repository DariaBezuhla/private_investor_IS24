import 'package:investors/search/Geopath.dart';

class Location {
  final String type;
  final String id;
  final String label;
  final Geopath geopath;

  Location({this.type, this.id, this.label, this.geopath});

  @override
  String toString() => label;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json['type'],
        id: json['id'],
        label: json['label'],
        geopath: Geopath.fromJson(json['geopath']),
      );
}

class Envelope {
  final List<Location> locations;

  Envelope({this.locations});

  factory Envelope.fromJson(List<dynamic> list) => Envelope(
        locations: list
            .map(
              (dynamic it) => Location.fromJson(it['entity']),
            )
            .toList(),
      );
}
