import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import '../constant.dart';
import 'package:easy_localization/easy_localization.dart';

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
        width: ScreenUtil().setWidth(470),
        margin: EdgeInsets.all(ScreenUtil().setHeight(16)),
        child: Column(children: <Widget>[
          //CASHFLOW VON STEUERN ROW
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Cashflow vor Steuern".tr().toString(),
                style: header4,
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(4)),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                                title: Icon(
                                  SystemIconsIS.is24_system_48px_info,
                                  size: ScreenUtil().setHeight(15),
                                ),
                                content: Text('cashflowDialog'.tr().toString(),
                                    style: styleText),
                                actions: [
                                  FlatButton(
                                    onPressed: () => Navigator.pop(
                                        context, false), // passing false
                                    child: Text('schließen'.tr().toString()),
                                  ),
                                ]));
                  },
                  child: Icon(
                    SystemIconsIS.is24_system_48px_info,
                    size: ScreenUtil().setWidth(15),
                  ),
                ),
              ),
              Spacer(),
              Text('250' + ' €', style: header4),
            ],
          ),
        ]),
      ),
    );
  }
}
