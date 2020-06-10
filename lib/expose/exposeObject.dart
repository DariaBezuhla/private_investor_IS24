import 'dart:convert';
import 'dart:core';

import 'package:privateinvestorsmobile/results/card/subtypes/address.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/contactDetails.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/coordinate.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/courtage.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/factor.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/living_space.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/marketValue.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/marketValuePerSqm.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/netYield.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/price.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/price_per_sqm.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/price_trend.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/rent_trend.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/room.dart';


class ExposeObject {
  bool active;
  String id;
  String description;
  String location;
  ContactDetails contactDetails;
  String regionGeoCode;
  DateTime creationDate;
  String title;
  Room rooms;
  LivingSpace livingSpace;
  Price price;
  PricePerSqm pricePerSqm;
  PriceTrend priceTrend;
  RentTrend rent;
  RentTrend rentTrend;
  RentTrend rentSubsidy;
  RentTrend rentAbsolute;
  Courtage courtage;
  bool hasCourtage;
  Address address;
  List<dynamic> gallery;
  String geoCode;
  bool rented;
  bool balcony;
  bool cellar;
  bool garden;
  bool lift;
  num constructionYear;
  String exposeType;
  String pictureUrl;
  String misc;

  num firstActivationDate;
  NetYield netYield;
  Factor factor;
  MarketValuePerSqm marketValuePerSqm;
  MarketValue marketValue;
  String rating;
  Coordinate coordinate;
  String condition;
  String parkingSpaceType;

  ExposeObject(
      {this.active,
      this.id,
      this.description,
      this.location,
      this.contactDetails,
      this.regionGeoCode,
      this.creationDate,
      this.title,
      this.rooms,
      this.livingSpace,
      this.price,
      this.pricePerSqm,
      this.priceTrend,
      this.rentTrend,
      this.courtage,
      this.hasCourtage,
      this.balcony,
      this.address,
      this.rented,
      this.gallery,
      this.geoCode,
      this.cellar,
      this.garden,
      this.lift,
      this.constructionYear,
      this.exposeType,
      this.pictureUrl,
      this.misc,
      this.rent,
      this.condition,
      this.coordinate,
      this.factor,
      this.firstActivationDate,
      this.marketValue,
      this.marketValuePerSqm,
      this.netYield,
      this.parkingSpaceType,
      this.rating,
      this.rentAbsolute,
      this.rentSubsidy});



  factory ExposeObject.fromJson(Map<String, dynamic> json) {
    return ExposeObject(
      active: json['active'],
      id: json['id'],
      description: utf8.decode(json['description'].toString().codeUnits),
      location: utf8.decode(json['location'].toString().codeUnits),
      contactDetails: ContactDetails.fromJson(json['contactDetails']),
      regionGeoCode: json['regionGeoCode'],
      creationDate: DateTime.parse(json['creationDate']),
      title: utf8.decode(json['title'].toString().codeUnits),
      rooms: Room.fromJson(json['rooms']),
      livingSpace: LivingSpace.fromJson(json['livingSpace']),
      price: Price.fromJson(json['price']),
      pricePerSqm: PricePerSqm.fromJson(json['pricePerSqm']),
      priceTrend: PriceTrend.fromJson(json['priceTrend']),
      rent: RentTrend.fromJson(json['rent']),
      rentTrend: RentTrend.fromJson(json['rentTrend']),
      rentSubsidy: RentTrend.fromJson(json['rentSubsidy']),
      rentAbsolute: RentTrend.fromJson(json['rentAbsolute']),
      courtage: Courtage.fromJson(json['courtage']),
      hasCourtage: json['hasCourtage'],
      address: Address.fromJson(json['address']),
      gallery: json['gallery'],
      geoCode: json['geoCode'],
      rented: json['rented'],
      balcony: json['balcony'],
      cellar: json['cellar'],
      garden: json['garden'],
      lift: json['lift'],
      constructionYear: json['constructionYear'],
      exposeType: json['exposeType'],
      pictureUrl: json['pictureUrl'],
      misc: json['misc'],
      firstActivationDate: json['firstActivationDate'],
      netYield: NetYield.fromJson(json['netYield']),
      factor: Factor.fromJson(json['factor']),
      marketValuePerSqm: MarketValuePerSqm.fromJson(json['marketValuePerSqm']),
      marketValue: MarketValue.fromJson(json['marketValue']),
      rating: json['rating'],
      coordinate: Coordinate.fromJson(json['coordinate']),
      condition: json['condition'],
      parkingSpaceType: json['parkingSpaceType'],
    );
  }
}
