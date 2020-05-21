import 'dart:core';

import './types.dart';

class Price {
  num value;
  Unit unit = Unit.EUR;

  Price({this.value});

  factory Price.fromJson(dynamic json) {
    return Price(
      value: json['value'],
    );
  }

  num getValue() {
    return value;
  }
}