import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:easy_localization/easy_localization.dart';

class CalcTopRow extends StatefulWidget {
  @override
  CalcTopRowState createState() => CalcTopRowState();
   const CalcTopRow({Key key}) : super(key: key);
}

class CalcTopRowState extends State<CalcTopRow> {

  var cashFlow;
  var returnOnEquity;
  var netRent;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        width: ScreenUtil().setWidth(470),
        height: ScreenUtil().setHeight(47),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 1
            Container(
              color: kTeal,
              height: ScreenUtil().setHeight(47),
              width: ScreenUtil().setWidth(10),
            ),

            // 2 CASHFLOW
            Column(
              children: <Widget>[
                Container(
                  color: kCard,
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(23),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                    cashFlow.toString() +  " €",
                      style: header4,
                    ),
                  ),
                ),
                Container(
                  color: kCard,
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(23),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Cashflow vor Steuern".tr().toString(),
                      style: styleDescriptionText,
                    ),
                  ),
                ),
              ],
            ),

            // 3
            Container(
              color: kTeal,
              height: ScreenUtil().setHeight(47),
              width: ScreenUtil().setWidth(10),
            ),

            // 4 DEBIT INTEREST
            Column(
              children: <Widget>[
                Container(
                  color: kCard,
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(23),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "0.95%",
                      style: header4,
                    ),
                  ),
                ),
                Container(
                  color: kCard,
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(23),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "InterestRate".tr().toString(),
                      style: styleDescriptionText,
                    ),
                  ),
                ),
              ],
            ),

            // 5
            Container(
              color: kTeal,
              height: ScreenUtil().setHeight(47),
              width: ScreenUtil().setWidth(10),
            ),

            // 6 RETURN ON EQUITY
            Column(
              children: <Widget>[
                Container(
                  color: kCard,
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(23),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(returnOnEquity.toString() + " %",
                      style: header4,
                    ),
                  ),
                ),
                Container(
                  color: kCard,
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(23),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Eigenkapitalrendite".tr().toString(),
                      style: styleDescriptionText,
                    ),
                  ),
                ),
              ],
            ),

            // 7
            Container(
              color: kTeal,
              height: ScreenUtil().setHeight(47),
              width: ScreenUtil().setWidth(10),
            ),
          ],
        ),
      ),
    );
  }
}
