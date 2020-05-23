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




final List<RealEstateObject> results = [
  RealEstateObject(
    id: "1",
    rooms: 1,
    data: 1,
    title : "1-Zi-Etagenwohnung im Herzen von Schöneberg mit Balkon",
    livingSpace: "350 m²",
    price: "95.000 €",
    pricePerSqm: " 2.714 €/m²",
    priceTrend: 10.07,
    rentTrend: -2.40,
    pictureUrl: "assets/objects/1.png",
    address: "13587 Berlin, Spandau (Spandau)",
    rating: "TOP",

  ),
  RealEstateObject(
    id: "2",
    rooms: 1,
    data: 2,
    title : "1-Zi-Etagenwohnung im Herzen von Schöneberg mit Balkon",
    livingSpace: "350 m²",
    price: "1.500.000 - 50.959.000 €",
    pricePerSqm: "2.714 €/m²",
    priceTrend: 10.07,
    rentTrend: 6.07,
    pictureUrl: "assets/objects/2.png",
    address: "13587 Berlin, Spandau (Spandau)",
    rating: "TOP",
  ),
  RealEstateObject(
    id: "4",
    rooms: 1,
    data: 1,
    title : "1-Zi-Etagenwohnung im Herzen von Schöneberg mit Balkon",
    livingSpace: "350 m²",
    price: "9.500.000 €",
    pricePerSqm: "2.714 €/m²",
    priceTrend: 3.99,
    rentTrend: 6.07,
    pictureUrl: "assets/objects/3.png",
    address: "13587 Berlin, Spandau (Spandau)",
    rating: "TOP",
  ),
  RealEstateObject(
    id: "5",
    rooms: 1,
    data: 1,
    title : "1-Zi-Etagenwohnung im Herzen von Schöneberg mit Balkon",
    livingSpace: "350 m²",
    price: "950.000 €",
    pricePerSqm: "2.714 €/m²",
    priceTrend: -1.07,
    rentTrend: -0.15,
    pictureUrl: "assets/objects/4.png",
    address: "13587 Berlin, Spandau (Spandau)",
    rating: "TOP",
  ),
  RealEstateObject(
    id: "6",
    rooms: 1,
    data: 1,
    title : "1-Zi-Etagenwohnung im Herzen von Schöneberg mit Balkon",
    livingSpace: "350 m²",
    price: "600.000 €",
    pricePerSqm: "2.714 €/m²",
    priceTrend: 10.07,
    rentTrend: 6.07,
    pictureUrl: "assets/objects/5.png",
    address: "13587 Berlin, Spandau (Spandau)",
    rating: "TOP",
  )
];


final List<RealEstateObject> saved = [
  RealEstateObject(
    id: "5",
    rooms: 1,
    data: 1,
    title : "1-Zi-Etagenwohnung im Herzen von Schöneberg mit Balkon",
    livingSpace: "350 m²",
    price: "950.000 €",
    pricePerSqm: "2.714 €/m²",
    priceTrend: -1.07,
    rentTrend: -0.15,
    pictureUrl: "assets/objects/4.png",
    address: "13587 Berlin, Spandau (Spandau)",
    rating: "TOP",
  ),
  RealEstateObject(
    id: "6",
    rooms: 1,
    data: 1,
    title : "1-Zi-Etagenwohnung im Herzen von Schöneberg mit Balkon",
    livingSpace: "350 m²",
    price: "600.000 €",
    pricePerSqm: "2.714 €/m²",
    priceTrend: 10.07,
    rentTrend: 6.07,
    pictureUrl: "assets/objects/5.png",
    address: "13587 Berlin, Spandau (Spandau)",
    rating: "TOP",
  )
];