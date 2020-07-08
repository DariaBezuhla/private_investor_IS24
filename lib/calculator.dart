import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/calculator/calc_cashflow.dart';
import 'package:privateinvestorsmobile/calculator/calc_finanzierung.dart';
import 'package:privateinvestorsmobile/calculator/calc_kaufpreis.dart';
import 'package:privateinvestorsmobile/calculator/calc_mieteinahmen.dart';
import 'package:privateinvestorsmobile/calculator/calc_top_row.dart';
import 'package:easy_localization/easy_localization.dart';

import 'appBar/app_bar_with_ArrowLeft.dart';
import 'bottomBar/bottom_bar.dart';
import 'constant.dart';
import 'icons/system_icons_i_s_icons.dart';

class Calculator extends StatefulWidget {
  final fetchedKaltmiete;
  final exposeId;
  const Calculator({Key key, this.fetchedKaltmiete, this.exposeId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CalculatorPageState();
  }
}

class CalculatorPageState extends State<Calculator> {
  final GlobalKey<CalcKaufpreisState> _key = GlobalKey();
  final GlobalKey<CalcFinanzierungState> _key2 = GlobalKey();
  final GlobalKey<CalcCashFlowState> _key3 = GlobalKey();
  final GlobalKey<CalcMieteinahmenState> _key4 = GlobalKey();

  void refreshTotalAcquisionCost() {
    setState(() {
      _key2.currentState.totalAcquisitionCost = _key.currentState.totalAcquisitionCost;

      //calculates and sets new numbers for the "with mortgage" part of calculator
      //when user moves slider od "purchase price"
      _key2.currentState.purchasePriceData = _key.currentState.purchasePriceData;
      _key2.currentState.equityResultValue = (_key2.currentState.purchasePriceData * _key2.currentState.ownFundsPercentData/100);
      _key2.currentState.netLoanAmount = (_key2.currentState.totalAcquisitionCost -_key2.currentState.equityResultValue.toInt());

      //debit interest, amortization and total rate
      _key2.currentState.debitInterestResultValue = (_key2.currentState.netLoanAmount * _key2.currentState.debitInterestRate/100/12);
      _key2.currentState.amortizationResultValue = (_key2.currentState.netLoanAmount * _key2.currentState.amortizationRate/100/12);
      _key2.currentState.totalRateToBank = (_key2.currentState.debitInterestResultValue + _key2.currentState.amortizationResultValue).toInt();
    });
  }


  void refreshCashFlow() {
    setState(() {
      _key3.currentState.totalMortgageRate = _key2.currentState.totalRateToBank;
      _key3.currentState.operatingCosts = _key4.currentState.operatingCosts;
      _key3.currentState.cashFlow = _key2.currentState.totalRateToBank + _key4.currentState.operatingCosts;

       //cashFlow amount

      (_key2.currentState.isSwitched) ?
      //if the flutter switch is on
      _key3.currentState.cashFlow = (_key4.currentState.kaltmiete - (_key4.currentState.operatingCosts + _key2.currentState.totalRateToBank)).round() :
      //if the flutter switch is off
      _key3.currentState.cashFlow = (_key4.currentState.kaltmiete - _key4.currentState.operatingCosts).round();
    });
  }

    void refreshCashFlow2() {
    setState(() {
    });
    }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithArrow(),
      body: Container(
        color: kBackgroundLight,
        child: Stack(
          children: <Widget>[
            ListView(
              padding: new EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(15)),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    //TOP ROW
                    CalcTopRow(),
                    SizedBox(height: ScreenUtil().setHeight(15)),

                    //KAUFPREIS
                    CalcKaufpreis(exposeId: widget.exposeId, parentFunction: refreshTotalAcquisionCost, key: _key),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    CalcMieteinahmen(fetchedKaltmiete: widget.fetchedKaltmiete, parentFunction: refreshCashFlow, key: _key4),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    CalcFinanzierung(exposeId: widget.exposeId, parentFunction: refreshCashFlow, key: _key2),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    CalcCashFlow(key: _key3),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 0,
      ),
    );
  }
}

class ModalBox extends StatelessWidget {
  final String content;
  const ModalBox({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            AlertDialog(
              contentPadding: EdgeInsets.only(top:30, left:30, right:20),
              buttonPadding: EdgeInsets.all(0),
              content: Text(content, style: TextStyle(color: styleText.color,fontSize: 20)),
              actions: [
                FlatButton(
                  onPressed: () =>
                      Navigator.pop(context, false), // passing false
                  child: Text('schließen'.tr().toString()),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  boxShadow: shadowMd, borderRadius: BorderRadius.circular(50)),

              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(

                  SystemIconsIS.is24_system_48px_info,
                  size: ScreenUtil().setHeight(30),
                )
              ),
            ),
          ],
        )
      ],
    );
  }
}
