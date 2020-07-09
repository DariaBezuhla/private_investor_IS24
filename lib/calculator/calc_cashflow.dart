import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import '../calculator.dart';
import '../constant.dart';
import 'package:easy_localization/easy_localization.dart';

class CalcCashFlow extends StatefulWidget {
  CalcCashFlowState createState() => CalcCashFlowState();
  const CalcCashFlow({Key key}) : super(key: key);
}

class CalcCashFlowState extends State<CalcCashFlow> {

  var cashFlow;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kCard,
      elevation: elevation,
      borderRadius: BorderRadius.circular(4.0),
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
                        builder: (_) => ModalBox(content:'cashflowDialog'.tr().toString()));
                  },
                  child: Icon(
                    SystemIconsIS.is24_system_48px_info,
                    size: ScreenUtil().setWidth(15),
                  ),
                ),
              ),
              Spacer(),
              Text(cashFlow.toString() + ' €', style: header4),
            ],
          ),
        ]),
      ),
    );
  }
}
