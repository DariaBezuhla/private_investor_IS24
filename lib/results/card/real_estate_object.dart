import 'dart:convert';
import 'dart:core';

import 'subtypes/address.dart';
import 'subtypes/living_space.dart';
import 'subtypes/price.dart';
import 'subtypes/price_per_sqm.dart';
import 'subtypes/price_trend.dart';
import 'subtypes/rent_trend.dart';
import 'subtypes/room.dart';

class RealEstateObject {
  String id;
  String title;
  LivingSpace livingSpace;
  String pictureUrl;
  Address address;
  String rating;
  Room rooms;
  Price price;
  PricePerSqm pricePerSqm;
  PriceTrend priceTrend;
  RentTrend rentTrend;


  RealEstateObject( {
    this.id,
    this.title,
    this.rooms,
    this.livingSpace,
    this.price,
    this.pricePerSqm,
    this.priceTrend,
    this.rentTrend,
    this.pictureUrl = 'https://dummyimage.com/640x360/fff/aaa',
    this.address,
    this.rating,
  });

  factory RealEstateObject.fromJson(Map<String, dynamic> json) {
    return RealEstateObject(
        id: json['id'],
        title: utf8.decode(json['title'].toString().codeUnits),
        livingSpace: LivingSpace.fromJson(json['livingSpace']),
        rooms: Room.fromJson(json['rooms']),
        price: Price.fromJson(json['price']),
        pricePerSqm: PricePerSqm.fromJson(json['pricePerSqm']),
        priceTrend: PriceTrend.fromJson(json['priceTrend']),
        rentTrend: RentTrend.fromJson(json['rentTrend']),
        address: Address.fromJson(json['address']),
        pictureUrl: json['pictureUrl'],
        rating: json['rating'],
    );
  }
}

