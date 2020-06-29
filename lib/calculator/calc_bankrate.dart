import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import '../constant.dart';
import 'package:easy_localization/easy_localization.dart';

class CalcBankRate extends StatefulWidget {
  @override
  _CalcBankRateState createState() => _CalcBankRateState();
}

double eigenkap = 0.0;

class _CalcBankRateState extends State<CalcBankRate> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kCard,
      child: Container(
        margin: EdgeInsets.all(
          ScreenUtil().setHeight(4),
        ),
        child: Column(children: <Widget>[
          //SOLLZINS
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sollzins".tr().toString(),
                style: styleText,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.004),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                                title: Icon(
                                  SystemIconsIS.is24_system_48px_info,
                                  size: ScreenUtil().setWidth(15),
                                ),
                                content: Text('debitDialog'.tr().toString(),
                                    style: styleText),
                                actions: [
                                  FlatButton(
                                    onPressed: () => Navigator.pop(
                                        context, false), // passing false
                                    child: Text('schließen'.tr().toString()),
                                  ),
                                ]));
                  },
                  child: Icon(
                    SystemIconsIS.is24_system_48px_info,
                    size: ScreenUtil().setWidth(15),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: ScreenUtil().setHeight(8)),

          //SOLLZINS INPUT FIELD
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
                      style: TextStyle(
                          color: kLightGrey, fontSize: dStyleLabel.fontSize),
                      decoration: InputDecoration(
                        hintText: 'z.B. 1.00%'.tr().toString(),
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
                  //width: MediaQuery.of(context).size.width * 0.33,
                  height: ScreenUtil().setHeight(45),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      eigenkap.toInt().toString() + " €",
                      style: styleText,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: ScreenUtil().setHeight(8)),

          //TILGUNSRATE ROW
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Tilgungsrate".tr().toString(),
                style: styleText,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.004),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                                title: Icon(
                                  SystemIconsIS.is24_system_48px_info,
                                  size: ScreenUtil().setHeight(15),
                                ),
                                content: Text(
                                    'amortizationDialog'.tr().toString(),
                                    style: styleText),
                                actions: [
                                  FlatButton(
                                    onPressed: () => Navigator.pop(
                                        context, false), // passing false
                                    child: Text('schließen'.tr().toString()),
                                  ),
                                ]));
                  },
                  child: Icon(
                    SystemIconsIS.is24_system_48px_info,
                    size: ScreenUtil().setWidth(15),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: ScreenUtil().setHeight(8)),

          //TILGUNSRATE INPUT FIELD
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
                      style: TextStyle(
                          color: kLightGrey, fontSize: dStyleLabel.fontSize),
                      decoration: InputDecoration(
                        hintText: 'z.B. 2.00%'.tr().toString(),
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
                  //width: MediaQuery.of(context).size.width * 0.33,
                  height: ScreenUtil().setHeight(45),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      eigenkap.toInt().toString() + " €",
                      style: styleText,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.025),

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

          //RATE AN DIE BANK ROW
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(7)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Rate an die Bank'.tr().toString(),
                  style: header4,
                ),
                Text(
                  '-140' + ' €',
                  style: header4,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
