class Expose {
  final String picture;

  Expose({this.picture});

  factory Expose.fromJson(Map<String, dynamic> json) => Expose(
        picture: json['sections'][0]['media'][0]['fullImageUrl'],
      );
}
