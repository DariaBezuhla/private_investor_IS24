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
  const Calculator({Key key, this.fetchedKaltmiete}) : super(key: key);

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
                  horizontal: ScreenUtil().setWidth(15)),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    //TOP ROW
                    CalcTopRow(),
                    SizedBox(height: ScreenUtil().setHeight(15)),

                    //KAUFPREIS
                    CalcKaufpreis(),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    CalcMieteinahmen(fetchedKaltmiete: widget.fetchedKaltmiete),
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
      bottomNavigationBar: BottomBar(
        selectedIndex: 0,
      ),
    );
  }
}

class ModalBox extends StatelessWidget {
  final String content;
  const ModalBox({
    Key key,
    this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(

            title: Icon(
              SystemIconsIS.is24_system_48px_info,
              size: ScreenUtil().setHeight(24),
            ),
            content: Text(content, style: styleText),
            actions: [
              FlatButton(
                onPressed: () => Navigator.pop(context, false), // passing false
                child: Text('schließen'.tr().toString()),
              ),
            ])
      ],
    );
  }
}
