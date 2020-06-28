import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant.dart';
import 'package:easy_localization/easy_localization.dart';

class PropertyTypeTextField extends StatefulWidget {
  final String topValue;
  ValueChanged<String> customHead;

  //For Filters -> transportation user wishes to Results List
  final Function() function;

  PropertyTypeTextField(
      {Key key, this.topValue, this.customHead, this.function})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new PropertyTypeTextFieldState();
}

class PropertyTypeTextFieldState extends State<PropertyTypeTextField> {
  static String estateType = "BOTH"; //default Real Estate Type
  List<String> propertyTypes = [
    "Alles".tr().toString(),
    "Wohnung".tr().toString(),
    "Haus".tr().toString(),
    "Neubau".tr().toString(),
  ];
  String dropdownValue = "Alles".tr().toString();

  void _onItemTapped() {
    setState(() {
      estateType = dropdownValue;
      widget.function();
    });
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
          SizedBox(height: ScreenUtil().setHeight(10)),
          Theme(
            data: new ThemeData(
              primaryColor: kTeal,
              primaryColorDark: kTeal,
            ),
            child: DropdownButtonFormField<String>(
              decoration: new InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kDivider,
                  ),
                ),
              ),
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  _onItemTapped();
                });
              },
              items:
                  propertyTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
