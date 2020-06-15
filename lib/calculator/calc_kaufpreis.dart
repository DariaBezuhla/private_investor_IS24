import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/constant.dart';

class CalcKaufpreis extends StatefulWidget {
  @override
  _CalcKaufpreisState createState() => _CalcKaufpreisState();
}

class _CalcKaufpreisState extends State<CalcKaufpreis> {

  var nk;
  var gesamt;
  double price = 0.0;
  double space = 0.0;

  String nebenkosten(price) {
    nk = (price.toInt() * 19 / 100);
    return nk.toInt().toString();
  }

  String gesamtPrice(price) {
    gesamt = price + nk;
    return gesamt.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: width, height: height);

    return Material(
      color: kCard,
      elevation: elevation,
      child: Container(
        width: ScreenUtil().setWidth(470),
        margin: EdgeInsets.all(
          ScreenUtil().setHeight(16),),
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
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(4)),
                  child: Icon(
                    SystemIconsIS.is24_system_48px_info,
                    size: ScreenUtil().setWidth(15),
                  ),
                ),
                Spacer(),
                Text(price.toInt().toString() + ' €',
                    style: styleText),
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
                value: price,
                min: 0,
                max: 250000,
                onChanged: (double newPrice) {
                  setState(() {
                    price = newPrice;
                  });
                },
                label: '$price',
              ),
            ),

            //KAUFNEBENKOSTEN ROW
            Padding(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('+ Kaufnebenkosten 19%', style: styleText),
                  Text(nebenkosten(price) + ' €', style: styleText)
                ],
              ),
            ),
//
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
                  Text(
                    gesamtPrice(price) + ' €',
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

