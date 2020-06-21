import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant.dart';
import 'package:easy_localization/easy_localization.dart';

class PropertyTypeTextField extends StatefulWidget {
  final String topValue;
  ValueChanged<String> customHead;

  PropertyTypeTextField(
      this.topValue, this.customHead);

  @override
  State<StatefulWidget> createState() => new _HomeInputField();
}

class _HomeInputField extends State<PropertyTypeTextField> {
  List<String> propertyTypes = [
    "Neubau".tr().toString(),
    "Wohnung".tr().toString(),
    "Haus".tr().toString(),
    "Alles".tr().toString()
  ];

  String dropdownValue = 'Neubau'.tr().toString();

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
                )),
                value: dropdownValue,
                onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
              items: propertyTypes.map<DropdownMenuItem<String>>((String value) {
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
