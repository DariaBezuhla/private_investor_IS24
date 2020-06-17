import 'package:easy_localization/easy_localization.dart';
class SetingsChoices {
  static  String Actuality = 'Aktualität'.tr().toString();
  static  String Price = 'Preis'.tr().toString();
  static  String PricePerSqm = 'Preis pro m2'.tr().toString();
  static String NetYield = 'Nettorendite'.tr().toString();

  static  List<String> choices = <String> [
    Actuality,
    Price,
    PricePerSqm,
    NetYield,
  ];
}