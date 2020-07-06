//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/calculator.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:easy_localization/easy_localization.dart';

class CalcMieteinahmen extends StatefulWidget {
   final fetchedKaltmiete;
   const CalcMieteinahmen({Key key, this.fetchedKaltmiete}) : super(key: key);

  _CalcMieteinahmenState createState() => _CalcMieteinahmenState();
}

class _CalcMieteinahmenState extends State<CalcMieteinahmen> {
  TextEditingController resultController = new TextEditingController();
  TextEditingController utilitiesController = new TextEditingController();
  TextEditingController reservesController = new TextEditingController();
  TextEditingController maintenanceController = new TextEditingController();

  double minValue = 0.0;
  double maxValue = 0.0;
  var kaltmiete;
  var inputUtilitiesValue;
  var resultValue;
  var inputReservesValue;
  var newInputUtilitiesValue;
  var reservesValue;
  var newReservesValue;
  var resultReservesValue;
  var maintenanceValue;
  var resultMaintenanceValue;
  var newMaintenanceValue;
  var operatingCosts = 0;

  @override
  void initState() {
    super.initState();
    kaltmiete = widget.fetchedKaltmiete;
    setState(() {
      maxValue = kaltmiete * 2;
      minValue = 0.0;
    });
    resultValue = (kaltmiete * 7.5 / 100).round().toString();
    resultController = new TextEditingController(text: resultValue);
    inputUtilitiesValue = (7.5).toString();
    reservesValue = (3.0).toString();
    maintenanceValue = (3.0).toString();
    resultReservesValue = (kaltmiete * 3.0 / 100).round().toString();
    resultMaintenanceValue = (kaltmiete * 3.0 / 100).round().toString();
    utilitiesController = new TextEditingController(text: inputUtilitiesValue);
    reservesController = new TextEditingController(text: reservesValue);
    maintenanceController = new TextEditingController(text: maintenanceValue);
    operatingCosts = (double.parse(resultValue) + double.parse(resultReservesValue) + double.parse(resultMaintenanceValue)).toInt();
    setState(() {
      newInputUtilitiesValue = double.parse(inputUtilitiesValue);
      newReservesValue = double.parse(reservesValue);
      newMaintenanceValue = double.parse(maintenanceValue);
      resultValue = (kaltmiete * newInputUtilitiesValue / 100).round();
      resultReservesValue = (kaltmiete * newReservesValue / 100).round();
      resultMaintenanceValue = (kaltmiete * newMaintenanceValue / 100).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: width, height: height);

    return Material(
      color: kCard,
      elevation: elevation,
      borderRadius: BorderRadius.circular(4.0),
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
                Text(kaltmiete.round().toString() + ' €',
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
                value: kaltmiete.toDouble(),
                min: minValue,
                max: maxValue,
                onChanged: (double newPrice) {
                  setState(() {
                    kaltmiete = newPrice.round().toDouble();
                    newInputUtilitiesValue = double.parse(inputUtilitiesValue);
                    newReservesValue = double.parse(reservesValue);
                    newMaintenanceValue = double.parse(maintenanceValue);
                    resultValue = (kaltmiete * newInputUtilitiesValue / 100).round();
                    resultReservesValue = (kaltmiete * newReservesValue / 100).round();
                    resultMaintenanceValue = (kaltmiete * newMaintenanceValue / 100).round();
                    operatingCosts = (resultValue + resultReservesValue + resultMaintenanceValue).toInt();
                  });
                },
                //label: '$kaltmiete',
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
                        controller: utilitiesController,
                        onChanged: (text) {
                          setState(() {
                            if (text == '') {
                              inputUtilitiesValue = (0.0).toString();
                              resultValue = 0;
                              operatingCosts = (resultValue + resultReservesValue + resultMaintenanceValue).toInt();
                              return;
                            }
                            inputUtilitiesValue = text;
                            double.parse(inputUtilitiesValue);
                            resultValue = (kaltmiete * double.parse(inputUtilitiesValue) / 100).round();
                            operatingCosts = (resultValue + resultReservesValue + resultMaintenanceValue).toInt();
                          });
                        },
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
                      height: ScreenUtil().setHeight(40),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(' %',
                          style: styleText,
                        ),
                      ),
                    )
                ),
                Flexible(
                  child: Container(
                    color: Colors.transparent,
                    height: ScreenUtil().setHeight(45),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(resultValue.toString() + " €")
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
                        controller: reservesController,
                        onChanged: (text) {
                          setState(() {
                            if (text == '') {
                              reservesValue = (0.0).toString();
                              resultReservesValue = 0;
                              operatingCosts = (resultValue + resultReservesValue + resultMaintenanceValue).toInt();
                              return;
                            }
                            reservesValue = text;
                            double.parse(reservesValue);
                            resultReservesValue = (kaltmiete * double.parse(reservesValue) / 100).round();
                            operatingCosts = (resultValue + resultReservesValue + resultMaintenanceValue).toInt();
                          });
                        },
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
                      height: ScreenUtil().setHeight(40),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(' %', style: styleText,
                        ),
                      ),
                    )
                ),
                Flexible(
                  child: Container(
                    color: Colors.transparent,
                    height: ScreenUtil().setHeight(45),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(resultReservesValue.toString() + " €")
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
                        controller: maintenanceController,
                        onChanged: (text) {
                          setState(() {
                            if (text == '') {
                              maintenanceValue = (0.0).toString();
                              resultMaintenanceValue = 0;
                              operatingCosts = (resultValue + resultReservesValue + resultMaintenanceValue).toInt();
                              return;
                            }
                            maintenanceValue = text;
                            double.parse(maintenanceValue);
                            resultMaintenanceValue = (kaltmiete * double.parse(maintenanceValue) / 100).round();
                            operatingCosts = (resultValue + resultReservesValue + resultMaintenanceValue).toInt();
                          });
                        },
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
                      height: ScreenUtil().setHeight(40),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(' %', style: styleText,
                        ),
                      ),
                    )
                ),
                Flexible(
                  child: Container(
                    color: Colors.transparent,
                    height: ScreenUtil().setHeight(45),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(resultMaintenanceValue.toString() + " €")
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(20)),

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
                      "-" + operatingCosts.round().toString() + " €",
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