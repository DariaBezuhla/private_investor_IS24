import 'dart:core';
import './types.dart';

class LivingSpace {
  num value;
  Unit unit = Unit.SQM;

  LivingSpace ({this.value});

  factory LivingSpace.fromJson (dynamic json) {
    return LivingSpace(
      value: json['value'],
    );
  }

  num getValue() {
    return value;
  }
}