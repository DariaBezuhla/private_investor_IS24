import 'dart:core';
import './types.dart';

class PriceTrend {
  num value;
  Unit unit = Unit.EUR;

  PriceTrend({this.value});

  factory PriceTrend.fromJson(dynamic json) {
    return PriceTrend(
        value: json['value']
    );
  }

  num getValue() {
    return value;
  }
}