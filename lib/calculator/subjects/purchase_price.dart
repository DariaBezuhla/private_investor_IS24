import 'dart:core';

class PurchasePrice {
  int purchasePrice;

  PurchasePrice({this.purchasePrice});

  factory PurchasePrice.fromJson(dynamic json) {
    return PurchasePrice(
      purchasePrice: json['purchasePrice'],
    );
  }

  String getPurchasePrice() {
    return purchasePrice.toString();
  }
}