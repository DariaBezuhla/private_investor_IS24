import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import '../constant.dart';


class CalcCashflow extends StatefulWidget {
  @override
  _CalcCashflowState createState() => _CalcCashflowState();
}

class _CalcCashflowState extends State<CalcCashflow> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kCard,
      elevation: elevation,
      child: Container(
        width: MediaQuery.of(context).size.width * 1.5,
        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        child: Column(
            children: <Widget>[


         //CASHFLOW VON STEUERN ROW
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Cashflow von Steuern",
                    style: header4,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.004),
                    child: Icon(
                      SystemIconsIS.is24_system_48px_info,
                      size: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                  Spacer(),
                  Text('250' + ' €',
                      style: header4),
                ],
              ),


            ]
        ),
      ),
    );
  }
}