class Expose {
  final String id;
  final String title;
  final String picture;
  final num price;
  final num space;
  final num rooms;

  Expose({
    this.id,
    this.title,
    this.picture,
    this.price,
    this.space,
    this.rooms,
  });

  num get expectedRent => pricePerSqm * 0.75;

  num get pricePerSqm => price ~/ space;

  num get netYield => getCashFlow(expectedRent, space) * 12 * 100 / price;

  static num getCashFlow(num rent, num space) =>
      rent -
      (rent * 0.03) - // Reserves
      (rent * 0.03) - // Maintenance
      (space * 2.7); // Utilities

  factory Expose.fromJson(Map<String, dynamic> json) => Expose(
        id: json['id'],
        title: json['address']['line'],
        picture: json['titlePicture']['full'],
        price: attribute(0, json),
        space: attribute(1, json),
        rooms: attribute(2, json),
      );

  static num attribute(int index, Map<String, dynamic> json) {
    final attribute = json['attributes'][index]['value'] as String;
    return int.parse(attribute.replaceAll(RegExp(r"\D"), ""));
  }
}
