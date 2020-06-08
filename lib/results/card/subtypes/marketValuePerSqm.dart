import 'package:privateinvestorsmobile/results/card/subtypes/types.dart';

class MarketValuePerSqm {
  num value;
  Unit unit = Unit.EUR_PER_SQM;

  MarketValuePerSqm({this.value});

  factory MarketValuePerSqm.fromJson(dynamic json) {
    return MarketValuePerSqm(value: json['value']);
  }
}