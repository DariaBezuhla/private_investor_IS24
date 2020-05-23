import 'dart:core';

class Address {
  String street;
  String houseNumber;
  String postcode;
  String quarter;
  String city;

  Address({
    this.street,
    this.houseNumber,
    this.postcode,
    this.quarter,
    this.city
  });

  factory Address.fromJson(dynamic json) {
    return Address(
        street: json['street'],
        houseNumber: json['houseNumber'],
        postcode: json['postcode'],
        quarter: json['quarter'],
        city: json['city']
    );
  }

  String getStreet() {
    return street;
  }

  String getHouseNumber() {
    return houseNumber;
  }

  String getPostCode() {
    return postcode;
  }

  String getQuarter() {
    return quarter;
  }

  String getCity() {
    return city;
  }

  @override
  String toString() {
    return '$postcode $city, $quarter';
  }
}