import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/screenutil.dart';
import '../../constant.dart';

class FiltersForAppBar extends StatelessWidget {
  final String theme;
  final int resultsLength;

  const FiltersForAppBar({Key key, this.theme, this.resultsLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarColor = (theme == 'Dark') ? dHeaderFooter : kHeaderFooter;
    var filterBarColor = (theme == 'Dark') ? dHeaderFooter : kHeaderFooter;
    var textStyle = (theme == 'Dark')
        ? CustomStyle.dStyleText(context)
        : CustomStyle.styleText(context);
    var numberStyle = CustomStyle.styleText(context);
    var lineLength = (resultsLength >= 100)
        ? ScreenUtil().setWidth(60.0)
        : ScreenUtil().setWidth(40.0);
    //var filterBarHeight = ScreenUtil().setHeight(10) + ScreenUtil().setWidth(30);
    //final statusBarHeight = 56.0;
    var shadowSize = (theme == 'Dark') ? elevation : elevation;
    var shadowColor = (theme == 'Dark') ? Colors.black : kShadow;
    var lineColor = (theme == 'Dark') ? kCharcoal : dTextColorLight;
    var backLine = (theme == 'Dark')
        ? Image.asset(
            'assets/highlights/Teal_05_Priority-Line_RGB.png',
            height: ScreenUtil().setWidth(27),
            width: lineLength,
            fit: BoxFit.fill,
          )
        : Image.asset(
            'assets/highlights/Teal_43_Priority-Swoosh_RGB.png',
            height: ScreenUtil().setWidth(27),
            width: lineLength,
            fit: BoxFit.fill,
          );

    return new Container(
      //height: statusBarHeight + filterBarHeight,
      color: filterBarColor,
      child: Column(
        //verticalDirection:VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 56.0,
            color: statusBarColor,
          ),
          Container(height: ScreenUtil().setHeight(1.0), color: lineColor),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(20),
            ), //
            child: Wrap(
              children: <Widget>[
                /*Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Spacer(),
                      SearchButton(),
                    ],
                  ),
                 */
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
                  child: Row(
                    children: <Widget>[
                      Text("Ihre Suche ergab".tr().toString(),
                          style: textStyle),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          backLine,
                          Center(
                              child: Text(
                            '${resultsLength}',
                            style: numberStyle,
                          )),
                        ],
                      ),
                      Text("Treffer".tr().toString(), style: textStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(height: ScreenUtil().setHeight(1.0), color: lineColor),
          //Container(width: MediaQuery.of(context).size.width - 48, height: 1.0, color: lineColor,),
        ],
      ),
    );
  }
}

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/screenutil.dart';
import '../../constant.dart';
import 'button_suche_bearbeiten.dart';


class FiltersForAppBar extends StatelessWidget {
  final String theme;
  final int resultsLength;

  const FiltersForAppBar({Key key, this.theme, this.resultsLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarColor = (theme == 'Dark') ? dHeaderFooter : kHeaderFooter;
    var filterBarColor = (theme == 'Dark') ? dHeaderFooter : kHeaderFooter;
    var textStyle = (theme == 'Dark') ? CustomStyle.dStyleText(context) : CustomStyle.styleText(context);
    var numberStyle = CustomStyle.styleText(context);
    var lineLength = (resultsLength >= 100) ? ScreenUtil().setWidth(60.0) : ScreenUtil().setWidth(40.0);
    //var filterBarHeight = ScreenUtil().setHeight(10) + ScreenUtil().setWidth(30);
    //final statusBarHeight = 56.0;
    var shadowSize = (theme == 'Dark') ? elevation : elevation;
    var shadowColor = (theme == 'Dark') ? Colors.black : kShadow;
    var lineColor = (theme == 'Dark') ? kCharcoal : dTextColorLight;
    var backLine = (theme == 'Dark') ?
    Image.asset(
      'assets/highlights/Teal_05_Priority-Line_RGB.png',
      height: ScreenUtil().setWidth(27),
      width: lineLength,
      fit: BoxFit.fill,
    )   :
    Image.asset(
      'assets/highlights/Teal_43_Priority-Swoosh_RGB.png',
      height: ScreenUtil().setWidth(27),
      width: lineLength,
      fit: BoxFit.fill,
    );

    return new Container(
      //height: statusBarHeight + filterBarHeight,
      color: filterBarColor,
      child: Column(
        //verticalDirection:VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Material(
            //elevation: shadowSize,
            //shadowColor: shadowColor,
            child: Wrap(
              children: <Widget>[
                Container(
                  height: 56.0,
                  color: statusBarColor,
                ),
              ],
            ),
          ),
          Container (height: 1.0, color: lineColor),
          Material(
            elevation: shadowSize,
            shadowColor: shadowColor,
            color: filterBarColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(20),),//
              child: Wrap(
                children: <Widget>[
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Spacer(),
                      SearchButton(),
                    ],
                  ),

                   */
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
                    child: Row(
                      children: <Widget>[
                        Text("Ihre Suche ergab".tr().toString(), style: textStyle),
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            backLine,
                            Center(
                                child: Text(
                                  '${resultsLength}',
                                  style: numberStyle,
                                )),
                          ],
                        ),
                        Text("Treffer".tr().toString(), style: textStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Container(width: MediaQuery.of(context).size.width - 48, height: 1.0, color: lineColor,),
        ],
      ),
    );
  }
}
 */
