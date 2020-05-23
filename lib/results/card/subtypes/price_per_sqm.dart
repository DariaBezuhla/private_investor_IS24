import 'dart:core';

import './types.dart';

class PricePerSqm {
  num value;
  Unit unit = Unit.EUR_PER_SQM;

  PricePerSqm({this.value});

  factory PricePerSqm.fromJson(dynamic json) {
    return PricePerSqm(
      value: json['value'],
    );
  }

  num getValue() {
    return value;
  }
}