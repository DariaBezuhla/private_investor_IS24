import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
class LanguageChoices {

  static  List<LanguageItem> choices = <LanguageItem> [
    LanguageItem("de","Deutsch"),
    LanguageItem("en","English")
  ];
  
  static LanguageItem getItem(Locale locale){
    return choices.where((element) => element.locale == locale.toLanguageTag()).first;
  }


}

class LanguageItem{
  String locale;
  String displayName;

  LanguageItem(this.locale, this.displayName);
}