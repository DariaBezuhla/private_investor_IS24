import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import '../constant.dart';


class CalcBankRate extends StatefulWidget {
  @override
  _CalcBankRateState createState() => _CalcBankRateState();
}

double eigenkap = 0.0;


class _CalcBankRateState extends State<CalcBankRate> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kCard,
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.005),
        child: Column(
            children: <Widget>[

              //SOLLZINS
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Sollzins",
                    style: styleText,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.004),
                    child: Icon(
                      SystemIconsIS.is24_system_48px_info,
                      size: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ],
              ),


            SizedBox(
                height: MediaQuery.of(context).size.height * 0.012),


              //SOLLZINS INPUT FIELD
              Row(
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width * 0.50,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: kTeal,
                        primaryColorDark: kTeal,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'z.B. 1.00%',
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
                  Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(eigenkap.toInt().toString() + " €",
                        style: styleText,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.012),


         //TILGUNSRATE ROW
              Row(
               crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Tilgunsrate",
                    style: styleText,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.004),
                    child: Icon(
                      SystemIconsIS.is24_system_48px_info,
                      size: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ],
              ),


           SizedBox(
                  height: MediaQuery.of(context).size.height * 0.012),


              //TILGUNSRATE ROW INPUT FIELD
              Row(
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.50,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.07,
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: kTeal,
                        primaryColorDark: kTeal,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'z.B. 2.00%',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x0FFd6d6d6),
                              ),
                            ),
                            labelStyle: TextStyle(
                                color: Color(0x0FFADADAD),
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.014)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.33,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.07,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(eigenkap.toInt().toString() + " €",
                        style: styleText,
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025),

              //HORIZONTAL LINE
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.0),
                child: Container(
                    child: new SizedBox(
                      height: MediaQuery.of(context).size.height * 0.001,
                      child: new Center(
                        child: new Container(
                          margin: new EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          height: MediaQuery.of(context).size.height * 0.001,
                          color: Colors.grey,
                        ),
                      ),
                    )
                ),
              ),


         //RATE AN DIE BANK ROW
              Padding(
                padding: EdgeInsets.only(top: MediaQuery
                    .of(context)
                    .size
                    .height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Rate an die Bank',
                      style: header4,
                    ),
                    Text(
                      '-140' + ' €',
                      style: header4,
                    ),
                  ],
                ),
              ),


            ]
        ),
      ),
    );
  }
}