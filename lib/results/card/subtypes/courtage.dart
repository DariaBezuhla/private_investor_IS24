import 'dart:core';

import 'package:privateinvestorsmobile/results/card/subtypes/types.dart';


class Courtage{
  String value;
  Unit unit = Unit.PERCENT;

  Courtage({
    this.value
  });

  factory Courtage.fromJson(dynamic json){
    return Courtage(
        value: json['value']
    );
  }

  String getValue() {
    return value;
  }

  Unit getUnit() {
    return unit;
  }
}