import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:easy_localization/easy_localization.dart';

class CalcTopRow extends StatefulWidget {
  @override
  _CalcTopRowState createState() => _CalcTopRowState();
}

class _CalcTopRowState extends State<CalcTopRow> {

  @override
  Widget build(BuildContext context) {

    return Material(
      elevation: elevation,
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

            // 2
            Column(
              children: <Widget>[
                Container(
                  color: kCard,
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(23),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("516 €",
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
                    child: Text("Cashflow vor Steuern".tr().toString(),
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

            // 4
            Column(
              children: <Widget>[
                Container(
                  color: kCard,
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(23),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("0.95%",
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
                    child: Text("Geb. Sollzins".tr().toString(),
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

            // 6
            Column(
              children: <Widget>[
                Container(
                  color: kCard,
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(23),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("9,1%",
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
                    child: Text("Eigenkapitalrendite".tr().toString(),
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


