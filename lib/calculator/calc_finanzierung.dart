import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'calc_api_data.dart';
import '../calculator.dart';

class CalcFinanzierung extends StatefulWidget {
  @override
  _CalcFinanzierungState createState() => _CalcFinanzierungState();
}

class _CalcFinanzierungState extends State<CalcFinanzierung> {
  TextEditingController equityController;
  TextEditingController debitInterestController;
  TextEditingController amortizationController;
  CalculatorDataService _calculatorDataService;

  bool isSwitched = false;
  var purchasePriceData = 0;
  var totalAcquisitionCost = 0;
  var additionalCostData = 0.0;
  var additionalCostPercentData = 0;
  var ownFundsPercentData = 0;
  var netLoanAmount = 0;
  var debitInterestRate = 0.0;
  var amortizationRate = 0;
  var totalRateToBank = 0;

  var inputValueEquity;
  var inputValueDebit;
  var inputValueAmortization;
  var equityResultValue = 0.0;
  var debitInterestResultValue = 0.0;
  var amortizationResultValue = 0.0;

  void initState() {
    super.initState();
    _calculatorDataService = CalculatorDataService();

    List<Future> futures = [
      _calculatorDataService.fetchAPIData(),
    ];

    Future.wait(futures).then((value) {
      setState(() {
        purchasePriceData = value[0].purchasePrice;
        additionalCostPercentData = value[0].totalPercentAdditionalCosts;
        ownFundsPercentData = value[0].totalPercentOwnFunds;
        equityResultValue = (purchasePriceData * ownFundsPercentData / 100);

        inputValueEquity = ownFundsPercentData.toString();
        equityController = TextEditingController(text: inputValueEquity);

        debitInterestRate = value[0].debitInterestRate;
        inputValueDebit = debitInterestRate.toString();
        debitInterestController = TextEditingController(text: inputValueDebit);

        amortizationRate = value[0].amortizationRate;
        inputValueAmortization = amortizationRate.toString();
        amortizationController = TextEditingController(text: inputValueAmortization);
      });
      countKaufnebenkosten();
      countTotalAcquisitionCost();
      countNetLoanAmount();
      countDebitInterestResultValue();
      countAmortizationResultValue();
      countTotalRateToBank();
    });
  }

  void countKaufnebenkosten() {
    setState(() {
      additionalCostData =
      (purchasePriceData * additionalCostPercentData / 100);
    });
  }

  void countTotalAcquisitionCost() {
    setState(() {
      totalAcquisitionCost = (purchasePriceData + additionalCostData).toInt();
    });
  }

  void countNetLoanAmount() {
    setState(() {
      netLoanAmount = totalAcquisitionCost - equityResultValue.toInt();
    });
  }

  void countDebitInterestResultValue() {
    debitInterestResultValue = (netLoanAmount * debitInterestRate / 100 / 12);
  }

  void countAmortizationResultValue() {
    amortizationResultValue = (netLoanAmount * amortizationRate / 100 / 12);
  }

  void countTotalRateToBank() {
    setState(() {
      totalRateToBank = (debitInterestResultValue + amortizationResultValue).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: kCard,
        elevation: elevation,
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          width: ScreenUtil().setWidth(470),
          margin: EdgeInsets.all(
            ScreenUtil().setHeight(16),
          ),
          child: Column(
            children: <Widget>[
              //FINANZIERUNG and SWITCH
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setHeight(4)),
                    child: FlutterSwitch(
                      activeColor: kTeal,
                      toggleSize: ScreenUtil().setHeight(17),
                      height: ScreenUtil().setHeight(25),
                      width: ScreenUtil().setWidth(55),
                      value: isSwitched,
                      onToggle: (value) {
                        setState(() {
                          isSwitched = !isSwitched;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: ScreenUtil().setWidth(16)),
                  Text(
                    "Finanzierung".tr().toString(),
                    style: styleButton,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(4)),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => ModalBox(
                            content: 'mortgageDialog'.tr().toString(),
                          ),
                        );
                      },
                      child: Icon(
                        SystemIconsIS.is24_system_48px_info,
                        size: ScreenUtil().setHeight(15),
                      ),
                    ),
                  ),
                ],
              ),

              ///////WHEN SWITCH IS ON//////////
              Visibility(
                visible: isSwitched,
                child: Column(children: <Widget>[
                  SizedBox(height: ScreenUtil().setHeight(16)),

                  //TOTAL ACQUISION PRICE ROW ROW
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Gesamtkaufpreis".tr().toString(),
                        style: styleText,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(4)),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => ModalBox(
                                  content: 'totalDialog'.tr().toString(),
                                ));
                          },
                          child: Icon(
                            SystemIconsIS.is24_system_48px_info,
                            size: ScreenUtil().setHeight(15),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(totalAcquisitionCost.round().toString() + ' €',
                          style: styleText),
                    ],
                  ),

                  SizedBox(height: ScreenUtil().setHeight(16)),

                  //EQUITY ROW
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Eigenkapital".tr().toString(),
                        style: styleText,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(4)),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => ModalBox(
                                  content: 'equityDialog'.tr().toString(),
                                ));
                          },
                          child: Icon(
                            SystemIconsIS.is24_system_48px_info,
                            size: ScreenUtil().setHeight(15),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //SLIDER
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
                      value: ownFundsPercentData.toDouble(),
                      min: 0,
                      max: 100,
                      onChanged: (double newProcent) {
                        setState(() {
                          ownFundsPercentData = newProcent.round();
                          equityResultValue = (purchasePriceData * ownFundsPercentData / 100);
                          inputValueEquity = ownFundsPercentData.toString();
                          equityController = TextEditingController(text: inputValueEquity);
                          netLoanAmount = (totalAcquisitionCost - equityResultValue.toInt());
                          debitInterestResultValue = (netLoanAmount * debitInterestRate / 100 / 12);
                          amortizationResultValue = (netLoanAmount * amortizationRate / 100 / 12);
                          totalRateToBank = (debitInterestResultValue + amortizationResultValue).toInt();
                        });
                      },
                      label: '$ownFundsPercentData',
                    ),
                  ),

                  //EQUITY PROCENT AND INPUT FIELD ROW
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          color: Colors.transparent,
                          height: ScreenUtil().setHeight(40),
                          child: Theme(
                            data: new ThemeData(
                              primaryColor: kTeal,
                              primaryColorDark: kTeal,
                            ),
                            child: TextFormField(
                              controller: equityController,
                              onChanged: (text) {
                                setState(() {
                                  if (text == '') {
                                    equityResultValue = 0.0;
                                    netLoanAmount = (totalAcquisitionCost -
                                        equityResultValue.toInt());
                                    totalRateToBank = (debitInterestResultValue + amortizationResultValue).toInt();
                                    return;
                                  }
                                  inputValueEquity = text;
                                  equityResultValue = (purchasePriceData * double.parse(inputValueEquity) / 100);
                                  netLoanAmount = (totalAcquisitionCost - equityResultValue.toInt());
                                  amortizationResultValue = (netLoanAmount * amortizationRate / 100 / 12);
                                  debitInterestResultValue = (netLoanAmount * debitInterestRate/ 100 / 12);
                                  totalRateToBank = (debitInterestResultValue + amortizationResultValue).toInt();
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
                            child: Text(
                              equityResultValue.round().toString() + " €",
                              style: styleText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: ScreenUtil().setHeight(16)),

                  //NET LOAN  ROW
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Nettodarlehen".tr().toString(),
                        style: styleButton,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(4)),
                      ),
                      Spacer(),
                      Text(netLoanAmount.toString() + ' €',
                          style: styleButton),
                    ],
                  ),

                  SizedBox(height: ScreenUtil().setHeight(10)),

                  //HORIZONTAL LINE
                  Container(
                      child: new SizedBox(
                        height: ScreenUtil().setHeight(1),
                        child: new Center(
                          child: new Container(
                            margin: new EdgeInsetsDirectional.only(
                                start: 1.0, end: 1.0),
                            height: ScreenUtil().setHeight(0.5),
                            color: Colors.grey,
                          ),
                        ),
                      )),

                  SizedBox(height: ScreenUtil().setHeight(10)),

                  //PAYMENT TO THE BANK SECTION STARTS HERE

                  //DEBIT INTEREST
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sollzins".tr().toString(),
                        style: styleText,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery
                                .of(context)
                                .size
                                .height * 0.004),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    ModalBox(
                                      content: 'debitDialog'.tr().toString(),
                                    ));
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

                  //DEBIT INTEREST INPUT FIELD
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          color: Colors.transparent,
                          height: ScreenUtil().setHeight(40),
                          child: Theme(
                            data: new ThemeData(
                              primaryColor: kTeal,
                              primaryColorDark: kTeal,
                            ),
                            child: TextFormField(
                              controller: debitInterestController,
                              onChanged: (text) {
                                // ignore: missing_return
                                setState(() {
                                  if (text == '') {
                                    debitInterestResultValue = 0.0;
                                    totalRateToBank = (debitInterestResultValue + amortizationResultValue).toInt();
                                    return;
                                  }
                                  inputValueDebit = text;
                                  debitInterestResultValue = (netLoanAmount * double.parse(inputValueDebit) / 100 / 12);
                                  totalRateToBank = (debitInterestResultValue + amortizationResultValue).toInt();
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
                            child: Text(
                              debitInterestResultValue.round().toString() + " €",
                              style: styleText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: ScreenUtil().setHeight(8)),

                  //AMORTIZATION RATE ROW
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Tilgungsrate".tr().toString(),
                        style: styleText,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery
                                .of(context)
                                .size
                                .height * 0.004),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    ModalBox(
                                      content: 'amortizationDialog'
                                          .tr()
                                          .toString(),
                                    ));
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

                  //AMORTIZATION RATE INPUT FIELD
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          color: Colors.transparent,
                          height: ScreenUtil().setHeight(40),
                          child: Theme(
                            data: new ThemeData(
                              primaryColor: kTeal,
                              primaryColorDark: kTeal,
                            ),
                            child: TextFormField(
                              controller: amortizationController,
                              onChanged: (text) {
                                // ignore: missing_return
                                setState(() {
                                  if (text == '') {
                                    amortizationResultValue = 0.0;
                                    totalRateToBank = (debitInterestResultValue + amortizationResultValue).toInt();
                                    return;
                                  }
                                  inputValueAmortization = text;
                                  amortizationResultValue = (netLoanAmount * double.parse(inputValueAmortization) / 100 / 12);
                                  totalRateToBank = (debitInterestResultValue + amortizationResultValue).toInt();
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
                          height: ScreenUtil().setHeight(40),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              amortizationResultValue.round().toString() + " €",
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
                            margin: new EdgeInsetsDirectional.only(start: 1.0,
                                end: 1.0),
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
                          '-' + totalRateToBank.toString() + " €",
                          style: header4,
                        ),
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
        ));
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