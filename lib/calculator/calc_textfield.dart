import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_detail_context.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';
import 'package:privateinvestorsmobile/results/card/view_states.dart';
import 'package:privateinvestorsmobile/calculator.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/constant.dart';

class CalcTextField extends StatefulWidget {
  @override
  _CalcTextFieldState createState() => _CalcTextFieldState();
}

class _CalcTextFieldState extends State<CalcTextField> {

  var myheader;
  String header;

  /*String showHeader(header) {
    myheader = header;
    return myheader;
  }
*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 1 - "Nicht umlagefähiges Hausgeld + Icon"
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(header,
              style: styleText,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.004),
              child: Icon(
                SystemIconsIS.is24_system_48px_info,
                size: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.012),

        //1. TEXT FIELD
        Row(
          children: <Widget>[
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Theme(
                data: new ThemeData(
                  primaryColor: kTeal,
                  primaryColorDark: kTeal,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x0FFd6d6d6),
                        ),
                      ),
                      labelStyle: TextStyle(
                          color: Color(0x0FFADADAD),
                          fontSize: MediaQuery.of(context).size.height * 0.014)
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.013),
      ],
    );
  }
}

