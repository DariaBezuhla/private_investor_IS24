import 'dart:core';

import './types.dart';

class RentTrend {
  num value;
  Unit unit = Unit.EUR;

  RentTrend({this.value});

  factory RentTrend.fromJson(dynamic json) {
    return RentTrend(
        value: json['value']
    );
  }

  num getValue() {
    return value;
  }
}