import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/calculator.dart';
import 'package:privateinvestorsmobile/calculator/calc_api_data.dart';
import 'package:privateinvestorsmobile/calculator/subjects/calculator_api_data_object.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:easy_localization/easy_localization.dart';

class CalcPurchasePrice extends StatefulWidget {
   final exposeId;
   final Function() parentFunctionCashFlow;
   final Function() parentFunctionReturnOnEquity;
  CalcPurchasePriceState createState() => CalcPurchasePriceState();
  const CalcPurchasePrice({Key key, this.exposeId, this.parentFunctionCashFlow, this.parentFunctionReturnOnEquity}) : super(key: key);

}

class CalcPurchasePriceState extends State<CalcPurchasePrice> {
  CalculatorDataService _calculatorDataService;

  CalculatorAPIData data;

  var totalAcquisitionCost = 0;
  var additionalCostData = 0.0;
  var additionalCostPercentData = 0;
  var purchasePriceData = 0;
  double minValue = 0.0;
  double maxValue = 0.0;

  @override
  void initState() {
    super.initState();
    _calculatorDataService = CalculatorDataService();
    _calculatorDataService.fetchAPIData(exposeId: widget.exposeId).then((value) {
      setState(() {
        data = value;
        purchasePriceData = data.purchasePrice;
        additionalCostPercentData = data.totalPercentAdditionalCosts;
        maxValue = purchasePriceData + (purchasePriceData * 20)/100;
        minValue = 20000.0;
        countAdditionalCosts();
        countTotalAcquisitionCost();

          //should be in the very end to read the right data after it was calculated
        widget.parentFunctionCashFlow();
      });
    });
  }


  void countAdditionalCosts() {
    setState(() {
      additionalCostData = (purchasePriceData * additionalCostPercentData/100);
    });
  }

 void countTotalAcquisitionCost() {
    setState(() {
      totalAcquisitionCost = (purchasePriceData + additionalCostData).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: width, height: height);

    return Material(
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
                  "Kaufpreis".tr().toString(),
                  style: styleText,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setHeight(4)),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => ModalBox(content: 'priceDialog'.tr().toString(),));
                    },
                    child: Icon(
                      SystemIconsIS.is24_system_48px_info,
                      size: ScreenUtil().setHeight(15),
                    ),
                  ),
                ),
                Spacer(),
                Text(purchasePriceData.toString() + ' €'),
              ],
            ),

            //KAUFPREIS SLIDER
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
                value: purchasePriceData.toDouble(),
                min: minValue,
                max: maxValue,
                onChanged: (double newPrice) {
                  setState(() {
                    purchasePriceData = newPrice.round();
                    additionalCostData = (purchasePriceData * additionalCostPercentData/100);
                    totalAcquisitionCost = (purchasePriceData + additionalCostData).toInt();
                    widget.parentFunctionCashFlow();
                    widget.parentFunctionReturnOnEquity();
                  });
                },
                label: '$purchasePriceData',
              ),
            ),

            //KAUFNEBENKOSTEN ROW
            Padding(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('+ Kaufnebenkosten'.tr().toString(), style: styleText),
                  Container(
                      child: Text(additionalCostPercentData.toString() + "%")),
                  Container(
                      child: Text(additionalCostData.round().toString() + ' €')),
                ],
              ),
            ),

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

            //KAUFGESAMTPREIS ROW
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Kaufgesamtpreis'.tr().toString(),
                    style: header4,
                  ),
                  Text(
                    totalAcquisitionCost.round().toString() + ' €',
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
