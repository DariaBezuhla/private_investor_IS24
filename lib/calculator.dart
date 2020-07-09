import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/calculator/calc_cashflow.dart';
import 'package:privateinvestorsmobile/calculator/calc_mortgageCosts.dart';
import 'package:privateinvestorsmobile/calculator/calc_purchasePrice.dart';
import 'package:privateinvestorsmobile/calculator/calc_operatingCosts.dart';
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
  final GlobalKey<CalcPurchasePriceState> _keyPurchasePrice = GlobalKey();
  final GlobalKey<CalcMortgageState> _keyMortgage = GlobalKey();
  final GlobalKey<CalcOperatingCostsState> _keyOperatingCosts = GlobalKey();
  final GlobalKey<CalcCashFlowState> _keyCashFlow = GlobalKey();
  final GlobalKey<CalcTopRowState> _keyCalcTopRow = GlobalKey();

  void refreshTotalAcquisionCost() {
    setState(() {
      _keyMortgage.currentState.totalAcquisitionCost = _keyPurchasePrice.currentState.totalAcquisitionCost;

      //calculates and sets new numbers for the "with mortgage" part of calculator
      //when user moves slider od "purchase price"
      _keyMortgage.currentState.purchasePriceData = _keyPurchasePrice.currentState.purchasePriceData;
      _keyMortgage.currentState.equityResultValue = (_keyMortgage.currentState.purchasePriceData * _keyMortgage.currentState.ownFundsPercentData/100);
      _keyMortgage.currentState.netLoanAmount = (_keyMortgage.currentState.totalAcquisitionCost -_keyMortgage.currentState.equityResultValue.toInt());

      //debit interest, amortization and total rate
      _keyMortgage.currentState.debitInterestResultValue = (_keyMortgage.currentState.netLoanAmount * _keyMortgage.currentState.debitInterestRate/100/12);
      _keyMortgage.currentState.amortizationResultValue = (_keyMortgage.currentState.netLoanAmount * _keyMortgage.currentState.amortizationRate/100/12);
      _keyMortgage.currentState.totalRateToBank = (_keyMortgage.currentState.debitInterestResultValue + _keyMortgage.currentState.amortizationResultValue).toInt();
    });
  }


  void refreshCashFlow() {
    setState(() {
      //cashFlow for the CalcCashFlow class
      _keyCashFlow.currentState.cashFlow = _keyMortgage.currentState.totalRateToBank + _keyOperatingCosts.currentState.operatingCosts;

        //cashFlow for the TopRow when user switches mortgage costs
       (_keyMortgage.currentState.isSwitched) ?
       //if the  switch is on
       _keyCalcTopRow.currentState.cashFlow = (_keyOperatingCosts.currentState.kaltmiete - (_keyOperatingCosts.currentState.operatingCosts + _keyMortgage.currentState.totalRateToBank)).round() :
       //if the switch is off
       _keyCalcTopRow.currentState.cashFlow = (_keyOperatingCosts.currentState.kaltmiete - _keyOperatingCosts.currentState.operatingCosts).round();

       //cashFlow when user switches mortgage costs
      (_keyMortgage.currentState.isSwitched) ?
      //if the  switch is on
      _keyCashFlow.currentState.cashFlow = (_keyOperatingCosts.currentState.kaltmiete - (_keyOperatingCosts.currentState.operatingCosts + _keyMortgage.currentState.totalRateToBank)).round() :
      //if the switch is off
      _keyCashFlow.currentState.cashFlow = (_keyOperatingCosts.currentState.kaltmiete - _keyOperatingCosts.currentState.operatingCosts).round();
    });
  }

  void refreshReturnOnEquity() {
    setState(() {
      //calculates the netRent
      _keyCalcTopRow.currentState.netRent =
          (_keyOperatingCosts.currentState.kaltmiete - _keyOperatingCosts.currentState.operatingCosts).round();

      //caluclates the return on equity %
      (_keyMortgage.currentState.isSwitched) ?
          //with the mortgage
      _keyCalcTopRow.currentState.returnOnEquity = ((((_keyCalcTopRow.currentState.netRent * 12) -
              (_keyMortgage.currentState.debitInterestResultValue * 12)) / _keyMortgage.currentState.equityResultValue) * 100).toStringAsFixed(1) :
          //without mortgage
      _keyCalcTopRow.currentState.returnOnEquity =
          ((_keyCalcTopRow.currentState.netRent * 12 * 100) / (_keyMortgage.currentState.totalAcquisitionCost)).toStringAsFixed(1);
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
                    CalcTopRow(key: _keyCalcTopRow),
                    SizedBox(height: ScreenUtil().setHeight(15)),

                    //KAUFPREIS
                    CalcPurchasePrice(exposeId: widget.exposeId, parentFunctionCashFlow: refreshTotalAcquisionCost,
                        parentFunctionReturnOnEquity: refreshReturnOnEquity , key: _keyPurchasePrice),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    CalcOperatingCosts(fetchedKaltmiete: widget.fetchedKaltmiete, parentFunctionCashFlow: refreshCashFlow,
                        parentFunctionReturnOnEquity: refreshReturnOnEquity, key: _keyOperatingCosts),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    CalcMortgage(exposeId: widget.exposeId, parentFunctionCashFlow: refreshCashFlow,
                        parentFunctionReturnOnEquity: refreshReturnOnEquity, key: _keyMortgage),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    CalcCashFlow(key: _keyCashFlow),
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
