import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/constant.dart';

class CalcTextField extends StatefulWidget {
  @override
  _CalcTextFieldState createState() => _CalcTextFieldState();
}

class _CalcTextFieldState extends State<CalcTextField> {
  var myheader;
  String header;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 1 - "Nicht umlagefähiges Hausgeld + Icon"
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              header,
              style: styleText,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(4)),
              child: Icon(
                SystemIconsIS.is24_system_48px_info,
                size: ScreenUtil().setHeight(15),
              ),
            ),
            Spacer(),
          ],
        ),

        SizedBox(height: ScreenUtil().setHeight(16)),

        //1. TEXT FIELD
        Row(
          children: <Widget>[
            Flexible(
              child: Container(
                color: Colors.transparent,
                width: ScreenUtil().setWidth(300),
                height: ScreenUtil().setHeight(45),
                child: Theme(
                  data: new ThemeData(
                    primaryColor: kTeal,
                    primaryColorDark: kTeal,
                  ),
                  child: TextFormField(
                    style: TextStyle(
                        color: kLightGrey, fontSize: dStyleLabel.fontSize),
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
          ],
        ),

        SizedBox(height: ScreenUtil().setHeight(16)),
      ],
    );
  }
}
