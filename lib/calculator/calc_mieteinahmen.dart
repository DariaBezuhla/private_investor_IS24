//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/calculator.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:easy_localization/easy_localization.dart';

class CalcMieteinahmen extends StatefulWidget {
  final fetchedKaltmiete;
  const CalcMieteinahmen({Key key, this.fetchedKaltmiete}) : super(key: key);

  @override
  _CalcMieteinahmenState createState() => _CalcMieteinahmenState();
}

class _CalcMieteinahmenState extends State<CalcMieteinahmen> {
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

  String gesamtPrice(price) {
    gesamt = price + mn;
    return gesamt.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kCard,
      elevation: elevation,
      child: Container(
        width: ScreenUtil().setWidth(470),
        margin: EdgeInsets.all(ScreenUtil().setHeight(16)),
        child: Column(
          children: <Widget>[
            //KAUFPREIS ROW
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Mieteinahmen".tr().toString(),
                  style: styleText,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setHeight(4)),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => ModalBox(content: 'rentalIncomeDialog'.tr().toString(),));
                    },
                    child: Icon(
                      SystemIconsIS.is24_system_48px_info,
                      size: ScreenUtil().setWidth(15),
                    ),
                  ),
                ),
                Spacer(),
                Text(widget.fetchedKaltmiete.toString() + ' €',
                    style: styleText),
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
                  });
                },
                label: '$mn',
              ),
            ),

            //THREE TEXT FIELDS
            // 1 - "Nicht umlagefähiges Hausgeld + Icon"
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Nicht umlagefähiges Hausgeld".tr().toString(),
                  style: styleText,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setHeight(5)),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => ModalBox(content: 'feeDialog'.tr().toString(),));
                    },
                    child: Icon(
                      SystemIconsIS.is24_system_48px_info,
                      size: ScreenUtil().setWidth(15),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),

            //1. TEXT FIELD
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Container(
                    color: Colors.transparent,
                    width: ScreenUtil().setWidth(300),
                    height: ScreenUtil().setHeight(45),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: kTeal,
                        primaryColorDark: kTeal,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kDivider,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.transparent,
                    //width: ScreenUtil().setWidth(170),
                    height: ScreenUtil().setHeight(45),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        hausgeld.toInt().toString() + " €",
                        style: styleText,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            //2. TEXT FIELD
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Rücklagen für Mietausfall".tr().toString(),
                  style: styleText,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setHeight(5)),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => ModalBox(content: 'rentLossDialog'.tr().toString(),));
                    },
                    child: Icon(
                      SystemIconsIS.is24_system_48px_info,
                      size: ScreenUtil().setWidth(15),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Container(
                    color: Colors.transparent,
                    width: ScreenUtil().setWidth(300),
                    height: ScreenUtil().setHeight(45),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: kTeal,
                        primaryColorDark: kTeal,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kDivider,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.transparent,
                    //width: ScreenUtil().setWidth(170),
                    height: ScreenUtil().setHeight(45),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        ruecklagen.toInt().toString() + " €",
                        style: styleText,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            //3. TEXT FIELD
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Handwerkerkosten".tr().toString(),
                  style: styleText,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setHeight(5)),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => ModalBox(content: 'maintenanceDialog'.tr().toString(),));
                    },
                    child: Icon(
                      SystemIconsIS.is24_system_48px_info,
                      size: ScreenUtil().setWidth(15),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Container(
                    color: Colors.transparent,
                    width: ScreenUtil().setWidth(300),
                    height: ScreenUtil().setHeight(45),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: kTeal,
                        primaryColorDark: kTeal,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kDivider,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.transparent,
                    //width: ScreenUtil().setWidth(170),
                    height: ScreenUtil().setHeight(45),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        hwkosten.toInt().toString() + " €",
                        style: styleText,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(20)),

            //CalcTextField(),
            //CalcTextField(),

            //HORIZONTAL LINE
            Container(
                child: new SizedBox(
              height: ScreenUtil().setHeight(1),
              child: new Center(
                child: new Container(
                  margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: ScreenUtil().setHeight(0.5),
                  color: Colors.grey,
                ),
              ),
            )),

            //BETRIEBSKOSTEN ROW
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Betriebskosten'.tr().toString(),
                    style: header4,
                  ),
                  Text(
                    gesamtPrice(mn) + ' €',
                    style: header4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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