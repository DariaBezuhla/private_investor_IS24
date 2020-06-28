import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/calculator/calc_api_data.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/constant.dart';

class CalcKaufpreis extends StatefulWidget {
  _CalcKaufpreisState createState() => _CalcKaufpreisState();
}

class _CalcKaufpreisState extends State<CalcKaufpreis> {
  CalculatorDataService _calculatorDataService;

  var buyingPrice = 0;
  var additionalCostData = 0.0;
  var additionalCostPercentData = 0;
  var purchasePriceData = 0;
  double minValue = 0.0;
  double maxValue = 0.0;

  @override
  void initState() {
    super.initState();
    _calculatorDataService = CalculatorDataService();

    List<Future> futures = [
       _calculatorDataService.fetchPurchasePrice(),
       _calculatorDataService.fetchAdditionalCosts(),
    ];

    Future.wait(futures).then((value) {
      setState((){
        purchasePriceData = value[0].purchasePrice;
        additionalCostPercentData = value[1].totalPercent;
        maxValue = purchasePriceData + 20000.0;
        minValue = 20000.0;
      });
      countKaufnebenkosten();
      wholeBuyingPrice();
    });
  }

  void countKaufnebenkosten() {
    setState(() {
      additionalCostData = (purchasePriceData * additionalCostPercentData/100);
    });
  }

  //count the Kaufgesamtpreis
 void wholeBuyingPrice() {
    setState(() {
       buyingPrice =(purchasePriceData + additionalCostData).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: width, height: height);

    return Material(
      elevation: elevation,
      child: Container(
        width: ScreenUtil().setWidth(470),
        margin: EdgeInsets.all(ScreenUtil().setHeight(16)),
        child: Column(
          children: <Widget>[

            //KAUFPREIS ROW
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Kaufpreis",
                  style: styleText,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(4)),
                  child: Icon(
                    SystemIconsIS.is24_system_48px_info,
                    size: ScreenUtil().setHeight(15),
                  ),
                ),
                Spacer(),

                Text(purchasePriceData.toString()),
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
                    buyingPrice = (purchasePriceData + additionalCostData).toInt();
                  });
                },
                label:'$purchasePriceData',
              ),
            ),

            //KAUFNEBENKOSTEN ROW
            Padding(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('+ Kaufnebenkosten', style: styleText),
                  Container(
                    child: Text(additionalCostPercentData.toString() + "%")
                  ),
                  Container(
                    child: Text(additionalCostData.round().toString())
                  )
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
                )
            ),

            //KAUFGESAMTPREIS ROW
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Kaufgesamtpreis',
                    style: header4,
                  ),
                  Text(buyingPrice.round().toString() + ' €',
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
