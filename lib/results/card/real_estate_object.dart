import 'dart:core';

import 'subtypes/address.dart';
import 'subtypes/living_space.dart';
import 'subtypes/price.dart';
import 'subtypes/price_per_sqm.dart';
import 'subtypes/price_trend.dart';
import 'subtypes/rent_trend.dart';
import 'subtypes/room.dart';

class RealEstateObject {
  final String id;
  final String title;
  final data;
  final rooms;
  final livingSpace;
  final price;
  final pricePerSqm;
  final priceTrend;
  final rentTrend;
  final String pictureUrl;
  final address;
  final rating;

  RealEstateObject( {
    this.id,
    this.title,
    this.rooms,
    this.data,
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
        title: json['title'],
        rooms: Room.fromJson(json['rooms']).getValue(),
        livingSpace: '' + LivingSpace.fromJson(json['livingSpace']).getValue().toString() + 'm²',
        price: '' + Price.fromJson(json['price']).getValue().toString() + '€',
        pricePerSqm: '' + PricePerSqm.fromJson(json['pricePerSqm']).getValue().toString() + '€/m²',
        priceTrend: PriceTrend.fromJson(json['priceTrend']).getValue(),
        rentTrend: RentTrend.fromJson(json['rentTrend']).getValue(),
        pictureUrl: json['pictureUrl'],
        address: Address.fromJson(json['address']).toString()
    );
  }
}




List<String> favorites = []; //IDs
