import 'dart:core';

import 'package:privateinvestorsmobile/results/card/subtypes/address.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/contactDetails.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/courtage.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/living_space.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/price.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/price_per_sqm.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/price_trend.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/rent_trend.dart';
import 'package:privateinvestorsmobile/results/card/subtypes/room.dart';


class ExposeObject{
  bool active;
  String id;
  String description;
  String location;
  ContactDetails contactDetails;
  String regionGeoCode;
  DateTime creationDate;
  String  title;
  Room rooms;
  LivingSpace livingSpace;
  Price price;
  PricePerSqm pricePerSqm;
  PriceTrend priceTrend;
  RentTrend rentTrend;
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

  ExposeObject({
    this.active,
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
    this.pictureUrl
  });

  factory ExposeObject.fromJson(Map<String, dynamic> json){
    return ExposeObject(
        active:json['active'],
        address: Address.fromJson(json['address']),
        balcony: json['balcony'],
        cellar: json['cellar'],
        constructionYear: json['constructionYear'],
        contactDetails: ContactDetails.fromJson(json['contactDetails']),
        courtage: Courtage.fromJson(json['courtage']),
        creationDate: DateTime.parse(json['creationDate']),
        description: json['description'],
        exposeType: json['exposeType'],
        gallery: json['gallery'],
        garden: json['garden'],
        geoCode: json['geoCode'],
        hasCourtage: json['hasCourtage'],
        id: json['id'],
        lift: json['lift'],
        livingSpace: LivingSpace.fromJson(json['livingSpace']),
        location: json['location'],
        pictureUrl: json['pictureUrl'],
        price: Price.fromJson(json['price']),
        pricePerSqm: PricePerSqm.fromJson(json['pricePerSqm']),
        priceTrend: PriceTrend.fromJson(json['priceTrend']),
        regionGeoCode: json['regionGeoCode'],
        rentTrend: RentTrend.fromJson(json['rentTrend']),
        rented: json['rented'],
        rooms: Room.fromJson(json['rooms']),
        title: json['title']
    );
  }

  bool getActive() {
    return active;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }

  String getLocation() {
    return location;
  }

  String getPictureUrl() {
    return pictureUrl;
  }
}