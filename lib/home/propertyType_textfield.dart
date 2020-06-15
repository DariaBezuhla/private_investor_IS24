import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:privateinvestorsmobile/home/location.dart';
import 'auto_complete_location.dart';
import '../constant.dart';

class PropertyTypeTextField extends StatefulWidget {
  final String topValue;
  final String textFieldValue;
  ValueChanged<String> customHead;
  ValueChanged<String> customWert;

  PropertyTypeTextField(
      this.topValue, this.customHead, this.textFieldValue, this.customWert);

  @override
  State<StatefulWidget> createState() => new _HomeInputField();
}

class _HomeInputField extends State<PropertyTypeTextField> {


  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.topValue,
              style: CustomStyle.textFieldHeader(context),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Theme(
            data: new ThemeData(
              primaryColor: kTeal,
              primaryColorDark: kTeal,
            ),
            child: Column(
              children: <Widget>[
                new TextFormField(

                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kLightGrey,
                          ),
                        ),
                        labelText: widget.textFieldValue,
                        labelStyle: CustomStyle.inputPlaceholder(context)),

                    ),


              ],
            ),
          ),
        ],
      ),
    );
  }




}
