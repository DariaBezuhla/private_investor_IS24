import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/home/search_data.dart';
import '../constant.dart';

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
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _onItemTapped() {
    setState(() {
      SearchData.budgetTo = int.parse(myController.text); //First for butget
      print(SearchData.budgetTo);
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
                controller: myController,
                decoration: new InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kDivider,
                    ),
                  ),
                  labelText: widget.normalFieldValue,
                  labelStyle: CustomStyle.textFieldInsideHeader(context),
                ),
                onChanged: widget.customWert,
            onTap: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}
