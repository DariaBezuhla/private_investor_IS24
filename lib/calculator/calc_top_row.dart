import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_detail_context.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';
import 'package:privateinvestorsmobile/results/card/view_states.dart';
import 'package:privateinvestorsmobile/calculator.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/constant.dart';

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
                    child: Text("Cashflow vor Steuern",
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
                    child: Text("Geb. Sollzins",
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
                    child: Text("Eigenkapitalrendite",
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


