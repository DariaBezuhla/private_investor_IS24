import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/home/location.dart';
import '../constant.dart';
import 'auto_complete_location.dart';

class NormalTextField extends StatefulWidget {
  final String topNormalValue;
  final String normalFieldValue;
  ValueChanged<String> customHead;
  ValueChanged<String> customWert;

  NormalTextField(this.topNormalValue, this.customHead, this.normalFieldValue,
      this.customWert);

  @override
  _NormalTextFieldState createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.topNormalValue,
              style: CustomStyle.textFieldHeader(context),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(8)),
          Theme(
            data: new ThemeData(
              primaryColor: kTeal,
              primaryColorDark: kTeal,
            ),
            child: new TextFormField(
                decoration: new InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kDivider,
                    ),
                  ),
                  labelText: widget.normalFieldValue,
                  labelStyle: CustomStyle.textFieldInsideHeader(context),
                ),
                onChanged: widget.customWert),
          ),
        ],
      ),
    );
  }
}