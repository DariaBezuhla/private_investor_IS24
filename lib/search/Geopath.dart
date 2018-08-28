class Geopath {
  final String uri;

  Geopath({this.uri});

  factory Geopath.fromJson(Map<String, dynamic> json) => Geopath(
        uri: json['uri'],
      );
}
