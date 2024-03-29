import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'button_suche_bearbeiten.dart';

class AppBarFilters extends StatelessWidget {
  final bool _filterOpen = true;
  final String theme;
  final int resultsLength;

  const AppBarFilters({Key key, this.theme, this.resultsLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarColor = (theme == 'Dark') ? dHeaderFooter : kHeaderFooter;
    var filterBarColor = (theme == 'Dark') ? dCardsColor : kBackgroundLight;
    var textStyle = (theme == 'Dark') ? dStyleBigText : styleBigText;
    var numberColor = styleBigText;
    var lineLength = (resultsLength.toString().length >= 3) ? 60.0 : 40.0;
    var filterBarHeight = 80.0;
    final statusBarHeight = 56.0;
    var shadowSize = (theme == 'Dark') ? elevation : elevation;
    var shadowColor = (theme == 'Dark') ? Colors.black : kShadow;
    var lineColor = (theme == 'Dark') ? kCharcoal : dTextColorLight;
    var backLine = (theme == 'Dark') ?
    Image.asset(
      'assets/highlights/Teal_05_Priority-Line_RGB.png',
      height: 27,
      width: lineLength,
      fit: BoxFit.fill,
    )   :
    Image.asset(
      'assets/highlights/Teal_43_Priority-Swoosh_RGB.png',
      height: 27,
      width: lineLength,
      fit: BoxFit.fill,
    );

    return new Container(
      //padding: EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + filterBarHeight,
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
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Wrap(
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Spacer(),
                      SearchButton(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: <Widget>[
                        Text("Ihre Suche ergab ", style: textStyle),
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            backLine,
                            Center(
                                child: Text(
                                  '${resultsLength}',
                                  style: numberColor,
                                )),
                          ],
                        ),
                        Text(" Treffer", style: textStyle),
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