import 'dart:async';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/home/location.dart';
import 'auto_complete_location.dart';

class NormalTextField extends StatefulWidget {
  final String topNormalValue;
  final String normalFieldValue;
  ValueChanged<String> customHead;
  ValueChanged<String> customWert;

  NormalTextField(
      this.topNormalValue, this.customHead, this.normalFieldValue, this.customWert);

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
              style: TextStyle(
                backgroundColor: Colors.transparent,
                fontFamily: 'MakeItSans',
                fontWeight: FontWeight.normal,
                fontSize: MediaQuery.of(context).size.height * 0.017,
                height: MediaQuery.of(context).size.height * 0.0007,
                color: Color(0x0FF858585),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.012,
          ),
          Theme(
            data: new ThemeData(
              primaryColor: Color(0x0FF00FFd0),
              primaryColorDark: Color(0x0F00ffd0),
            ),
            child: new TextFormField(
                decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x0FFd6d6d6),
                      ),
                    ),
                    labelText: widget.normalFieldValue,
                    labelStyle: TextStyle(
                        color: Color(0x0FFADADAD),
                        fontSize: MediaQuery.of(context).size.height * 0.014)
                ),
                onChanged: widget.customWert
            ),
          ),
        ],
      ),
    );
  }
}


