class Expose {
  final String id;
  final String title;
  final Address address;
  final Picture picture;
  final int space;

  Expose({this.id, this.title, this.address, this.picture, this.space});

  factory Expose.fromJson(Map<String, dynamic> json) => Expose(
        id: json['@id'],
        title: json['title'],
        address: Address.fromJson(json['address']),
        //picture: Picture.fromJson(json['titlePicture']),
        //space: json['livingSpace'],
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

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
      scales: (json['urls']['url'] as List)
          .map((it) => Scale.fromJson(it))
          .toList());
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
  final int value;
  final String currency;

  Price({this.value, this.currency});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        value: json['value'],
        currency: json['currency'],
      );
}
