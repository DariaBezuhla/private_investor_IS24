import 'package:privateinvestorsmobile/results/card/subtypes/types.dart';

class NetYield {
  num value;
  Unit unit = Unit.PERCENT;

  NetYield({this.value});

  factory NetYield.fromJson(dynamic json) {
    return NetYield(
      value: json['value'],
    );
  }
}