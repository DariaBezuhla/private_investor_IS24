import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/home/horizontal_line.dart';
import 'package:privateinvestorsmobile/icons/aditional_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'home_textfield.dart';

class WeitereFilter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeitereFilterDropDown();
  }
}

bool _investFilters = false;
bool _immobilieFilters = false;
bool _additionalFilters = false;

var pressedSaniert = false;
var pressedVermietet = false;
var pressedPlausible = false;

class _WeitereFilterDropDown extends State<WeitereFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(

      //MAIN CONTAINER
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[

          //WEITERE FILTER ROW
          //plus and minus icon

          RawMaterialButton(
            onPressed: showAdditionalFilters,
            constraints: BoxConstraints(),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  (_additionalFilters == false)
                      ? Icon(
                    SystemIconsIS.is24_system_48px_add,
                    size: MediaQuery
                        .of(context)
                        .size
                        .height * 0.040,
                  )
                      : Icon(
                    AditionalIconsIS.additional_icons_48px_forbidden,
                    color: Color(0x0FF333333),
                    size: MediaQuery
                        .of(context)
                        .size
                        .height * 0.040,
                  ),


                  SizedBox(width: MediaQuery
                      .of(context)
                      .size
                      .height * 0.020),

                  //TEXT WEITERE FILTER
                  (_additionalFilters == false)
                      ? Text(
                    "Weitere Filter",
                    style: header4,
                  )
                      : Text(
                    "Weniger Filter",
                    style: header4,
                  ),

                  SizedBox(width: MediaQuery
                      .of(context)
                      .size
                      .height * 0.030),


                  //DOWN/UP ICON
                  (_additionalFilters == false)
                      ? Icon(
                    SystemIconsIS.is24_system_48px_chevron_down,
                    size: MediaQuery
                        .of(context)
                        .size
                        .height * 0.040,
                  ) : Icon(
                    SystemIconsIS.is24_system_48px_chevron_up,
                    color: Color(0x0FF333333),
                    size: MediaQuery
                        .of(context)
                        .size
                        .height * 0.040,),

                ]),
          ),

          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.012),


          //INVESTITIONEN ROW
          Visibility(
              visible: _additionalFilters,
              child: Column(
                children: <Widget>[
                  RawMaterialButton(
                      onPressed: showInvestFilters,
                      constraints: BoxConstraints(),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Investitionen",
                              style: header4,
                            ),
                            _investFilters ?
                            Icon(SystemIconsIS.is24_system_48px_chevron_up,
                              size: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.030,) :
                            Icon(
                              SystemIconsIS.is24_system_48px_chevron_down,
                              size: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.030,
                            ),

                          ])),

                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.012),

                  HorizontalLine(),

                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.025),



                  //INVESTITIONEN OPENED FILTER
                  Visibility(
                    visible: _investFilters,
                    child: Column(children: <Widget>[
                      //5 INPUT FIELDS FOR INVESTITIONEN
                      new HomeTextField("Nettorendite ab", (String str) {print(str);}, "z.B. ab 3%", (String st) {print(st);}),

                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.025),

                      new HomeTextField("Kaufpreisentwicklung", (String str) {print(str);}, "ab 5% ", (String st) {print(st);}),

                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.025),

                      new HomeTextField("Mietpreisentwicklung", (String str) {print(str);}, "z.B. 5%", (String st) {print(st);}),

                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.025),

                      new HomeTextField("Faktor", (String str) {print(str);}, "z.B. bis 10", (String st) {print(st);}),

                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.025),

                      new HomeTextField("Preis pro m2", (String str) {print(str);}, "z.B. bis 600 €", (String st) {print(st);}),

                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.025),
                    ]),
                  ),



                  //IMMOBILIE ROW
                  Visibility(
                      visible: _additionalFilters,
                      child: Column(children: <Widget>[

                        RawMaterialButton(
                            onPressed: showImmobilieFilters,
                            constraints: BoxConstraints(),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Immobilie",
                                    style: header4,
                                  ),
                                  (_immobilieFilters == false)
                                      ? Icon(
                                    SystemIconsIS.is24_system_48px_chevron_down,
                                    size: MediaQuery.of(context).size.height * 0.030,
                                  ) : Icon(
                                    SystemIconsIS.is24_system_48px_chevron_up,
                                    color: Color(0x0FF333333),
                                    size: MediaQuery.of(context).size.height * 0.030,
                                  ),

                                ])
                        ),
                      ])),

                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.012),

                  HorizontalLine(),

                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.025),


                  //IMMOBILIE OPENED FILTERS

                  Visibility(
                    visible: _immobilieFilters,
                    child: Column(
                      children: <Widget>[

                        //2 TEXT FIELDS FOR IMMOBILIE

                        new HomeTextField("Zimmer", (String str) {print(str);}, "Zimmer egal", (String st) {print(st);}),

                        SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.025),

                        new HomeTextField("Größe", (String str) {print(str);}, "z.B ab 100 m2", (String st) {print(st);}),

                        SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.025),


                        //3 BUTTONS FOR IMMOBILIE PART
                        new ButtonTheme(
                          minWidth: double.infinity,
                          child: FlatButton(
                            color: pressedSaniert ? kTeal : kBackgroundLight,
                            padding: EdgeInsets.all(10.0),
                            onPressed: () {
                              setState(() {
                                pressedSaniert = !pressedSaniert;
                              });
                            },
                            child: Text("Saniert",
                                style:
                                pressedSaniert ? styleButton : disabledButton),
                          ),
                        ),

                        SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.005),

                        new ButtonTheme(
                          minWidth: double.infinity,
                          child: FlatButton(
                            color: pressedVermietet ? kTeal : kBackgroundLight,
                            padding: EdgeInsets.all(10.0),
                            onPressed: () {
                              setState(() {
                                pressedVermietet = !pressedVermietet;
                              });
                            },
                            child: Text("Vermietet",
                                style: pressedVermietet
                                    ? styleButton
                                    : disabledButton),
                          ),
                        ),

                        SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.005),

                        new ButtonTheme(
                          minWidth: double.infinity,
                          child: FlatButton(
                            color: pressedPlausible ? kTeal : kBackgroundLight,
                            padding: EdgeInsets.all(10.0),
                            onPressed: () {
                              setState(() {
                                pressedPlausible = !pressedPlausible;
                              });
                            },
                            child: Text("Nur plausible",
                                style: pressedPlausible
                                    ? styleButton
                                    : disabledButton),
                          ),
                        ),

                        SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.012),

                        HorizontalLine(),

                        SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.025),
                      ],
                    ),
                  ),
                ],
              )),
        ]));
  }

  void showInvestFilters() {
    setState(() {
      _investFilters = !_investFilters;
    });
  }

  void showImmobilieFilters() {
    setState(() {
      _immobilieFilters = !_immobilieFilters;
    });
  }

  void showAdditionalFilters() {
    setState(() {
      _additionalFilters = !_additionalFilters;
    });
  }
}
