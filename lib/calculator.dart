import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/appBar/app_bar_with_ArrowLeft.dart';
import 'package:privateinvestorsmobile/calculator/calc_cashflow.dart';
import 'package:privateinvestorsmobile/calculator/calc_finanzierung.dart';
import 'package:privateinvestorsmobile/calculator/calc_kaufpreis.dart';
import 'package:privateinvestorsmobile/calculator/calc_mieteinahmen.dart';
import 'package:privateinvestorsmobile/calculator/calc_top_row.dart';
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
              padding: new EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.04,
                0.0,
                MediaQuery.of(context).size.width * 0.04,
                0.0,
              ),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    //TOP ROW
                    CalcTopRow(),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02),
                    //KAUFPREIS
                    CalcKaufpreis(),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02),
                    CalcMieteinahmen(),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02),
                    CalcFinanzierung(),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02),
                    CalcCashflow(),
                     SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02),

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
