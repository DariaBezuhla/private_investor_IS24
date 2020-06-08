import 'dart:convert';
import 'dart:core';

class Address {
  String street;
  String houseNumber;
  String postcode;
  String quarter;
  String city;

  Address(
      {this.street, this.houseNumber, this.postcode, this.quarter, this.city});

  factory Address.fromJson(dynamic json) {
    return Address(
      street: utf8.decode(json['street'].toString().codeUnits),
      houseNumber: utf8.decode(json['houseNumber'].toString().codeUnits),
      postcode: utf8.decode(json['postcode'].toString().codeUnits),
      quarter: utf8.decode(json['quarter'].toString().codeUnits),
      city: utf8.decode(json['city'].toString().codeUnits),
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
