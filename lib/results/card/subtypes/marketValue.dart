import 'package:privateinvestorsmobile/results/card/subtypes/types.dart';

class MarketValue {
  num value;
  Unit unit = Unit.EUR;

  MarketValue({this.value});

  factory MarketValue.fromJson(dynamic json) {
    return MarketValue(value: json['value']);
  }
}