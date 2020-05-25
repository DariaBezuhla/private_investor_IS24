import 'package:flutter/material.dart';


class HomeTextField extends StatelessWidget {
  final String topValue;
  final String textFieldValue;
  ValueChanged<String> customHead;
  ValueChanged<String> customWert;

  HomeTextField(this.topValue, this.customHead, this.textFieldValue, this.customWert);

  @override
  Widget build (BuildContext context){
    return Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              topValue,
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
                  labelText: textFieldValue,
                  labelStyle: TextStyle(
                      color: Color(0x0FFADADAD),
                      fontSize: MediaQuery.of(context).size.height * 0.014)
              ),
              onChanged: customWert
          ),
    ),
        ],
      ),
    );
  }
}


