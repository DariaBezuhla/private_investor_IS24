import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/appBar/app_bar_for_expose.dart';
import 'package:privateinvestorsmobile/calculator/calc_cashflow.dart';
import 'package:privateinvestorsmobile/calculator/calc_finanzierung.dart';
import 'package:privateinvestorsmobile/calculator/calc_kaufpreis.dart';
import 'package:privateinvestorsmobile/calculator/calc_mieteinahmen.dart';
import 'package:privateinvestorsmobile/calculator/calc_top_row.dart';
import 'appBar/app_bar_with_ArrowLeft.dart';
import 'bottomBar/bottom_bar.dart';
import 'constant.dart';


class Calculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CalculatorPage();
  }
}

 class _CalculatorPage extends State<Calculator> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBarWithArrow(),
      body: Container(
        color: kBackgroundLight,
        child: Stack(
          children: <Widget>[
            ListView(
              padding: new EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(15)
              ),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    //TOP ROW
                    CalcTopRow(),
                    SizedBox(height: ScreenUtil().setHeight(15)),

                    //KAUFPREIS
                    CalcKaufpreis(),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    CalcMieteinahmen(),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    CalcFinanzierung(),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    CalcCashflow(),
                    SizedBox(height: ScreenUtil().setHeight(15)),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomBar(selectedIndex: 0, theme: light,),
    );
  }

  }
