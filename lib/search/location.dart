class Location {
  final String id;
  final num lat;
  final num lon;
  final String type;
  final String searchType;
  final String parentName;
  final String displayName;

  Location({
    this.id,
    this.lat,
    this.lon,
    this.type,
    this.searchType,
    this.parentName,
    this.displayName,
  });

  @override
  String toString() => "$parentName - $displayName";

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json['id'],
        lat: json['lat'],
        lon: json['lon'],
        type: json['type'],
        searchType: json['searchType'],
        parentName: json['parentName'],
        displayName: json['displayName'],
      );
}
