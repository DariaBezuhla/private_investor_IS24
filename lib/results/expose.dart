class Expose {
  final String id;
  final String title;
  final Address address;
  final Picture picture;
  final Price price;
  final num space;
  final num rooms;

  Expose({
    this.id,
    this.title,
    this.address,
    this.picture,
    this.price,
    this.space,
    this.rooms,
  });

  Price get expectedRent => Price(value: pricePerSqm.value * 0.75);

  Price get pricePerSqm => Price(value: price.value ~/ space);

  num get netYield =>
      getCashFlow(expectedRent.value, space).value * 12 * 100 / price.value;

  static Price getCashFlow(num rent, num space) => Price(
        value: rent -
            (rent * 0.03) - // Reserves
            (rent * 0.03) - // Maintenance
            (space * 2.7), // Utilities
      );

  factory Expose.fromJson(Map<String, dynamic> json) => Expose(
        id: json['@id'],
        title: json['title'],
        address: Address.fromJson(json['address']),
        picture: Picture.fromJson(json['titlePicture']),
        price: Price.fromJson(json['price']),
        space: json['livingSpace'],
        rooms: json['numberOfRooms'],
      );
}

class Address {
  final String street;
  final String number;
  final String postcode;
  final String city;
  final String quarter;

  Address({this.street, this.number, this.postcode, this.city, this.quarter});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'],
        number: json['houseNumber'],
        postcode: json['postcode'],
        city: json['city'],
        quarter: json['quarter'],
      );
}

class Picture {
  final List<Scale> scales;

  Picture({this.scales});

  factory Picture.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return Picture(scales: <Scale>[]);
    }

    return Picture(
        scales: (json['urls'][0]['url'] as List)
            .map((it) => Scale.fromJson(it))
            .toList());
  }
}

class Scale {
  final String scale;
  final String href;

  Scale({this.scale, this.href});

  factory Scale.fromJson(Map<String, dynamic> json) => Scale(
        scale: json['@scale'],
        href: json['@href'],
      );
}

class Price {
  final num value;
  final String currency;

  Price({this.value, this.currency: "EUR"});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        value: json['value'],
        currency: json['currency'],
      );
}
