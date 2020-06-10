import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:privateinvestorsmobile/icons/product_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../constant.dart';

class SettingsContent extends StatefulWidget {
  final String theme;

  const SettingsContent({
    Key key,
    this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {}

  @override
  _SettingsContentState createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  var nk;
  var gesamt;
  double mn = 0.0;
  double hausgeld = 0.0;
  double ruecklagen = 0.0;
  double hwkosten = 0.0;

  String mieteinahmen(price) {
    mn = (price.toInt() * 19 / 100);
    return mn.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getTheme();

    //var colorIcon = (widget.theme == 'Dark') ? dIconColor : kCharcoal;
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
              child: Text(
                'Dein Investment Profil',
                style: CustomStyle.header3(context),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(24),
              ),
              child: Text(
                  'Für optimiertere Suchergebnisse kannst du hier dein Investment Profil konfigurieren. Damit hilfst du uns, alle Ergebnisse genau auf deine Bedürfnisse abzustimmen.',
                  style: CustomStyle.styleText(context)),
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
                        data: theme.primaryIconTheme,
                        child: Icon(
                          ProductIconsIS.is24_product_48px_book_with_euro_sign,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          'Eigenkapital',
                          style: CustomStyle.header4(context),
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
                          "Maximal",
                          style: CustomStyle.styleText(context),
                        ),
                        Spacer(),
                        Text(
                          mn.toInt().toString() + ' €',
                          style: CustomStyle.styleText(context),
                        ),
                      ],
                    ),

                    //SLIDER 1
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: ScreenUtil().setHeight(5),
                        activeTrackColor: kTeal,
                        inactiveTrackColor: kGrey,
                        thumbColor: Colors.white,
                        //to do: add Custom Thumbshape with shadow
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
                child: Divider(color: theme.dividerColor),
              ),
            ],
          ),
        ),

        //location
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(24),
                          horizontal: ScreenUtil().setWidth(24)),
                      child: IconTheme(
                        data: theme.primaryIconTheme,
                        child: Icon(
                          ProductIconsIS.is24_product_48px_location,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          'Ortung',
                          style: CustomStyle.header4(context),
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
                          'Geo-Location verwenden',
                          style: CustomStyle.styleText(context),
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
                        value: isSwitched,
                        onToggle: (value) {
                          setState(() {
                            isSwitched = !isSwitched;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(10),
                    horizontal: ScreenUtil().setWidth(24)),
                child: Divider(color: theme.dividerColor),
              ),
            ],
          ),
        ),

        //appearance
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
                        data: theme.primaryIconTheme,
                        child: Icon(
                          SystemIconsIS.is24_system_48px_rating_state_2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          'Design',
                          style: CustomStyle.header4(context),
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
                          'Dark-Theme',
                          style: CustomStyle.styleText(context),
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
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(10),
                    horizontal: ScreenUtil().setWidth(24)),
                child: Divider(color: theme.dividerColor),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24)),
          // Settings
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    child: Text(
                      "Einstellungen",
                      style: CustomStyle.header3(context),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Benachrichtigungen",
                          style: CustomStyle.styleText(context),
                        ),
                        IconTheme(
                          data: theme.iconTheme,
                          child: Icon(
                            SystemIconsIS.is24_system_48px_chevron_right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sprachauswahl",
                          style: CustomStyle.styleText(context),
                        ),
                        IconTheme(
                          data: theme.iconTheme,
                          child: Icon(
                            SystemIconsIS.is24_system_48px_chevron_right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Feedback zur App",
                          style: CustomStyle.styleText(context),
                        ),
                        IconTheme(
                          data: theme.iconTheme,
                          child: Icon(
                            SystemIconsIS.is24_system_48px_chevron_right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                // padding: EdgeInsets.symmetric(
                //   vertical: ScreenUtil().setHeight(12),
                // ),
                child: Divider(color: theme.dividerColor),
              ),

              //plus membership
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(24)),
                    child: Text(
                      "Plus Mitgliedschaft",
                      style: CustomStyle.header3(context),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Du möchtest immer als Erstes von neuen Objekten erfahren und exklusive Beratung? Das und vieles mehr erreichst du durch eine Plus-Mitgliedschaft, die du jetzt einen Monat lang kostenlos testen kannst. ",
                      style: CustomStyle.styleText(context),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(24)),
                      child: ButtonTheme(
                        child: FlatButton(
                          color: theme.buttonColor,
                          textColor: kCharcoal,
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(10),
                              horizontal: ScreenUtil().setWidth(20)),
                          onPressed: () {
                            /*...*/
                          },
                          child: Text(
                            "Plus freischalten",
                            style: CustomStyle.styleButton(context),
                          ),
                        ),
                      )),
                ],
              ),
              Container(
                padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
                child: Divider(color: theme.dividerColor),
              ),

              //Privacy
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(12)),
                    child: Text(
                      "Privacy",
                      style: CustomStyle.header3(context),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Impressum",
                          style: CustomStyle.styleText(context),
                        ),
                        IconTheme(
                          data: theme.iconTheme,
                          child: Icon(
                            SystemIconsIS.is24_system_48px_chevron_right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Infos zum Tracking",
                          style: CustomStyle.styleText(context),
                        ),
                        IconTheme(
                          data: theme.iconTheme,
                          child: Icon(
                            SystemIconsIS.is24_system_48px_chevron_right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Datenschutz",
                          style: CustomStyle.styleText(context),
                        ),
                        IconTheme(
                          data: theme.iconTheme,
                          child: Icon(
                            SystemIconsIS.is24_system_48px_chevron_right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Geschäftsbedingungen",
                          style: CustomStyle.styleText(context),
                        ),
                        IconTheme(
                          data: theme.iconTheme,
                          child: Icon(
                            SystemIconsIS.is24_system_48px_chevron_right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lizenzhinweise Dritter",
                          style: CustomStyle.styleText(context),
                        ),
                        IconTheme(
                          data: theme.iconTheme,
                          child: Icon(
                            SystemIconsIS.is24_system_48px_chevron_right,
                          ),
                        ),
                      ],
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
