import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:privateinvestorsmobile/icons/product_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/settings/language_choices.dart';
import 'package:privateinvestorsmobile/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import '../main.dart';
import 'data_protection_page.dart';
import 'feedback_selection.dart';
import 'impress_page.dart';
import 'terms_and_condition_page.dart';
import 'tracking_information.dart';

class SettingsContent extends StatefulWidget {
  final ThemeData theme;

  const SettingsContent({
    Key key,
    this.theme,
  }) : super(key: key);

  @override
  _SettingsContentState createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  var nk;
  var gesamt;
  double hausgeld = 0.0;
  double ruecklagen = 0.0;
  double hwkosten = 0.0;
  double mn = 0.0;
  bool _setCurrentLocation;

  @override
  initState() {
    super.initState();
    _getPreferenceBool(locationKey).then((value) => setState(() {
          //print("geo-location" + value.toString());
          _setCurrentLocation = value;
        }));
    _getPreferenceDouble(equityKey).then((value) => setState(() {
          //print(value);
          mn = value;
        }));
  }

  String mieteinahmen(price) {
    mn = (price.toInt() * 19 / 100);
    return mn.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getDisplayTheme(context);

    bool isSwitched = false;

    return ListView(
      children: <Widget>[
        //intro
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(24),
                  vertical: ScreenUtil().setHeight(24)),
              child: Text('Dein Investment Profil'.tr().toString(),
                  style: widget
                      .theme.textTheme.headline3 //CustomStyle.header3(context),
                  ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(24),
              ),
              child: Text(
                  'Für optimiertere Suchergebnisse kannst du hier dein Investment Profil konfigurieren. Damit hilfst du uns, alle Ergebnisse genau auf deine Bedürfnisse abzustimmen.'
                      .tr()
                      .toString(),
                  style: widget.theme.textTheme.bodyText2),
            ),
          ],
        ),

        //eigenkapital
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(24),
                          horizontal: ScreenUtil().setWidth(24)),
                      child: IconTheme(
                        data: widget.theme.primaryIconTheme,
                        child: Icon(
                          ProductIconsIS.is24_product_48px_book_with_euro_sign,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          'Eigenkapital'.tr().toString(),
                          style: widget.theme.textTheme.headline4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Maximal".tr().toString(),
                          style: widget.theme.textTheme.bodyText2,
                        ),
                        Spacer(),
                        Text(
                          mn.toInt().toString() + ' €',
                          style: widget.theme.textTheme.bodyText2,
                        ),
                      ],
                    ),

                    //SLIDER 1
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: ScreenUtil().setHeight(5),
                        activeTrackColor: dSliderColor,
                        inactiveTrackColor: kGrey,
                        thumbColor: kTeal,
                        trackShape: CustomTrackShape(),
                        overlayColor: kCharcoal.withOpacity(.2),
                      ),
                      child: Slider(
                        value: mn,
                        min: 0,
                        max: 250000,
                        onChanged: (double newPrice) {
                          setState(() {
                            mn = newPrice;
                            _setPreferenceDouble(equityKey, newPrice);
                          });
                        },
                        label: '$mn',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(10),
                    horizontal: ScreenUtil().setWidth(24)),
                child: Divider(color: widget.theme.dividerColor),
              ),
            ],
          ),
        ),

        //location
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/ Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(24),
                    vertical: ScreenUtil().setHeight(24)),
                child: Text(
                  "Einstellungen".tr().toString(),
                  style: widget.theme.textTheme.headline3,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(12),
                            horizontal: ScreenUtil().setWidth(24)),
                        child: IconTheme(
                          data: widget.theme.primaryIconTheme,
                          child: Icon(
                            ProductIconsIS.is24_product_48px_location,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            'Ortung'.tr().toString(),
                            style: widget.theme.textTheme.headline4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(24)),
                          child: Text(
                            'Geo-Location verwenden'.tr().toString(),
                            style: widget.theme.textTheme.bodyText2,
                          ),
                        ),
                      ),
                      (_setCurrentLocation is bool)
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(24)),
                              child: FlutterSwitch(
                                activeColor: kTeal,
                                inactiveColor: kGrey,
                                toggleSize: ScreenUtil().setHeight(17),
                                height: ScreenUtil().setHeight(20),
                                width: ScreenUtil().setWidth(50),
                                value: _setCurrentLocation,
                                onToggle: (value) {
                                  //print(value);
                                  setState(() {
                                    _setCurrentLocation = value;
                                    _setPreferenceBool(locationKey, value);
                                  });
                                },
                              ),
                            )
                          : Container(
                              width: 0,
                              height: 0,
                            ),
                    ],
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Divider(color: widget.theme.dividerColor)),
              //LANGUAGE
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(12),
                            horizontal: ScreenUtil().setWidth(24)),
                        child: IconTheme(
                          data: widget.theme.primaryIconTheme,
                          child: Icon(
                            ProductIconsIS.is24_product_48px_geo_location,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            'Sprachauswahl'.tr().toString(),
                            style: widget.theme.textTheme.headline4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(24)),
                          child: Text(
                            "Sprache verwenden".tr().toString(),
                            style: widget.theme.textTheme.bodyText2,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(24)),
                        child: PopupMenuButton<LanguageItem>(
                          child: Container(
                              child: Row(
                            children: [
                              Container(
                                child: Text(
                                  LanguageChoices.getItem(context.locale)
                                      .displayName,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12),
                              ),
                              Icon(
                                SystemIconsIS.is24_system_48px_chevron_down,
                                size: 24,
                              ),
                            ],
                          )),
                          onSelected: (lang) {
                            //print(lang.locale);
                            setState(() {
                              EasyLocalization.of(context).locale =
                                  Locale(lang.locale);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PrivateInvestors(theme:theme )));
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return LanguageChoices.choices.map(
                              (LanguageItem choice) {
                                return PopupMenuItem<LanguageItem>(
                                  value: choice,
                                  child: Text(
                                    choice.displayName,
                                    style: theme.textTheme.bodyText2,
                                  ),
                                );
                              },
                            ).toList();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Divider(color: widget.theme.dividerColor)),

              //NOTIFICATIONS
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(12),
                            horizontal: ScreenUtil().setWidth(24)),
                        child: IconTheme(
                          data: widget.theme.primaryIconTheme,
                          child: Icon(
                            SystemIconsIS.is24_system_48px_notification_alert,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            'Benachrichtigungen'.tr().toString(),
                            style: widget.theme.textTheme.headline4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(24)),
                          child: Text(
                            "Empfange Benachrichtigungen".tr().toString(),
                            style: TextStyle(
                                fontSize:
                                    widget.theme.textTheme.bodyText2.fontSize,
                                color: widget.theme.disabledColor),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(24)),
                        child: Icon(
                          SystemIconsIS.is24_system_48px_chevron_down,
                          color: widget.theme.disabledColor,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Divider(color: widget.theme.dividerColor)),
        //appearance
        /*Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(24),
                          horizontal: ScreenUtil().setWidth(24)),
                      child: IconTheme(
                        data: widget.theme.primaryIconTheme,
                        child: Icon(
                          SystemIconsIS.is24_system_48px_rating_state_2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          'Design'.tr().toString(),
                          style: widget.theme.textTheme.headline4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(24)),
                        child: Text(
                          'Dark-Theme'.tr().toString(),
                          style: widget.theme.textTheme.bodyText2,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(24)),
                      child: FlutterSwitch(
                        activeColor: kTeal,
                        inactiveColor: kGrey,
                        toggleSize: ScreenUtil().setHeight(17),
                        height: ScreenUtil().setHeight(20),
                        width: ScreenUtil().setWidth(50),
                        value: isSwitched =
                            themeProvider.getTheme() == dark ? true : false,
                        onToggle: (value) {
                          setState(() {
                            isSwitched = !isSwitched;
                            themeProvider.setTheme(isSwitched ? dark : light);
                            _setPreferenceBool(themeKey, isSwitched);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: Scree
                    nUtil().setHeight(10),
                    horizontal: ScreenUtil().setWidth(24)),
                child: Divider(color: widget.theme.dividerColor),
              ),
            ],
          ),
        ),*/

        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(24),
              vertical: ScreenUtil().setWidth(0)),
          // Settings
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*GestureDetector(
                    /* onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationPage(),
                          ));
                    },*/
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Benachrichtigungen".tr().toString(),
                            style: TextStyle(
                                fontSize:
                                    widget.theme.textTheme.bodyText2.fontSize,
                                color: widget.theme.disabledColor),
                          ),
                          IconTheme(
                            data: IconThemeData(
                                size: widget.theme.iconTheme.size,
                                color: widget.theme.disabledColor),
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LanguageSelection(
                              theme: widget.theme,
                            ),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sprachauswahl".tr().toString(),
                            style: widget.theme.textTheme.bodyText2,
                          ),
                          IconTheme(
                            data: widget.theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),*/
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeedbackSelection(
                              theme: widget.theme,
                            ),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Feedback zur App".tr().toString(),
                            style: widget.theme.textTheme.bodyText2,
                          ),
                          IconTheme(
                            data: widget.theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 24),
                  child: Divider(color: widget.theme.dividerColor)),

              //plus membership
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(24)),
                    child: Text(
                      "Plus Mitgliedschaft".tr().toString(),
                      style: widget.theme.textTheme.headline3,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Du möchtest immer als Erstes von neuen Objekten erfahren und exklusive Beratung? Das und vieles mehr erreichst du durch eine Plus-Mitgliedschaft, die du jetzt einen Monat lang kostenlos testen kannst."
                          .tr()
                          .toString(),
                      style: widget.theme.textTheme.bodyText2,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(24)),
                      child: ButtonTheme(
                        child: FlatButton(
                          disabledColor: widget.theme.disabledColor,
                          color: widget.theme.buttonColor,
                          /*  textColor: kCharcoal,*/
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(10),
                              horizontal: ScreenUtil().setWidth(20)),
                          onPressed: null,
                          /*() async {
                            const url =
                                'https://www.immobilienscout24.de/meinkonto/premium-profil-freischalten/?utm_medium=app&utm_campaign=residential_profile&utm_term=rebranding_treatment&utm_source=iphone&utm_content=account_overview_premium_cta&fbclid=IwAR3w5BaEk2ZWTLtKD4FofpcT34Zni9u_PEoc7P4z0I4t8_FNCTlrqYehc7o';

                            if (await canLaunch(url)) {
                              await launch(url, forceSafariVC: false);
                            } else {
                              await launch(url, forceSafariVC: true);
                            }
                          },*/
                          child: Text(
                            "Plus freischalten".tr().toString(),
                            style: TextStyle(
                                fontSize:
                                    widget.theme.textTheme.button.fontSize,
                                color: widget.theme.accentColor),
                          ),
                        ),
                      )),
                ],
              ),
              Container(
                padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
                child: Divider(color: widget.theme.dividerColor),
              ),

              //Privacy
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(12)),
                    child: Text(
                      "Privacy".tr().toString(),
                      style: widget.theme.textTheme.headline3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ImpressPage(theme: widget.theme),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Impressum".tr().toString(),
                            style: widget.theme.textTheme.bodyText2,
                          ),
                          IconTheme(
                            data: widget.theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TrackingInformation(theme: widget.theme),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Infos zum Tracking".tr().toString(),
                            style: widget.theme.textTheme.bodyText2,
                          ),
                          IconTheme(
                            data: widget.theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DataProtectionPage(theme: widget.theme),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Datenschutz".tr().toString(),
                            style: widget.theme.textTheme.bodyText2,
                          ),
                          IconTheme(
                            data: widget.theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TermsAndConditionPage(theme: widget.theme),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Geschäftsbedingungen".tr().toString(),
                            style: widget.theme.textTheme.bodyText2,
                          ),
                          IconTheme(
                            data: widget.theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showAboutDialog(context: context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lizenzhinweise Dritter".tr().toString(),
                            style: widget.theme.textTheme.bodyText2,
                          ),
                          IconTheme(
                            data: widget.theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// https://github.com/flutter/flutter/issues/37057 @clocksmith
class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width * 0.99;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

void _setPreferenceBool(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

Future<bool> _getPreferenceBool(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? false;
}

void _setPreferenceDouble(String key, double value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key, value);
}

Future<double> _getPreferenceDouble(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(key) ?? 0;
}
