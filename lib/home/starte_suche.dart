import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/home/home_textfield.dart';
import 'package:privateinvestorsmobile/home/textfield_normal.dart';
import 'package:privateinvestorsmobile/home/weitere_filter.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import '../results.dart';

class StarteSuche extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _StarteSuchePage();
  }
}

 class _StarteSuchePage extends State<StarteSuche> {

   final String containerTitle =
       "Starte deine\n\n"
       "suche";

   final String containerDescription =
       "Hier findest du in Zukunft persönliche Empfehlungen und Neuigkeiten passend zu deinen Interessen";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),

          //HEADLINE
          //1. First line
          AutoSizeText(
              'Kapitalanlagen in Deutschland', //header5 < header4
              maxLines: 1,
              minFontSize: MediaQuery.of(context).size.width * 0.0,
              style: headerCharcoal
          ),

          SizedBox(height: MediaQuery.of(context).size.width * 0.02),

          //2. Second line
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AutoSizeText(
                  'Der ',
                  minFontSize: header5.fontSize,
                  maxFontSize: header4.fontSize,
                  style: dHeader6),
              AutoSizeText(
                  'Marktführer:',
                  minFontSize: header5.fontSize,
                  maxFontSize: header4.fontSize,
                  style: dHeader7
              ),
              AutoSizeText(
                  ' Die Nr.1 rund um',
                  minFontSize: header5.fontSize,
                  maxFontSize: header4.fontSize,
                  style: dHeader6
              ),
            ],
          ),
          //SizedBox(height: 3),

          //3. Third line
          Align(
            alignment: Alignment.topCenter,
            child: Text('Immobilien', style: dHeader6),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.05),

          Container(
            padding: new EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.03),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Material(
                  color: Colors.white,
                  elevation: 2.0,
                  shadowColor: Colors.grey,
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.045,
                        left: MediaQuery.of(context).size.height * 0.03,
                        right: MediaQuery.of(context).size.height * 0.03
                    ),

                    //MAIN CONTAINER
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(containerTitle,
                          style: styleContainerDescription,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        AutoSizeText(
                          containerDescription,
                          minFontSize: MediaQuery.of(context).size.width * 0.0,
                          style: styleContainerDescription2,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),

                        //1. TEXTFIELD
                        Theme(
                          data: new ThemeData(
                            primaryColor: kTeal,
                            primaryColorDark: kTeal,
                          ),
                          child:  new HomeTextField(
                              "Region", (String str){print(str);},"Wo: Bezirk, Stadt oder Bundesland", (String st){print(st);}
                              ),
                        ),

                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.022
                        ),

                        //2. TEXTFIELD
                        Theme(
                          data: new ThemeData(
                            primaryColor: kTeal,
                            primaryColorDark: kTeal,
                          ),
                          /*child: new HomeTextField(
                              "Realestate", (String str){print(str);},"Wohnung", (String st){print(st);}
                          ),*/
                          child: new NormalTextField(
                              "Realestate", (String str){print(str);},"Wohnung", (String st){print(st);}
                          ),
                        ),

                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.022
                        ),

                        //3. TEXTFIELD
                        Theme(
                          data: new ThemeData(
                            primaryColor: kTeal,
                            primaryColorDark: kTeal,
                          ),
                          child: new NormalTextField(
                              "Budget bis", (String str){print(str);},"100.000€", (String st){print(st);}
                          ),
                        ),

                         SizedBox(
                            height: MediaQuery.of(context).size.height * 0.022
                        ),

                        WeitereFilter(),

                        //SUCHEN BUTTON
                        new ButtonTheme(
                          minWidth: double.infinity,
                          child: FlatButton(
                            color: kTeal,
                            textColor: kCharcoal,
                            padding: EdgeInsets.all(10.0),
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteGenerator(builder: (context) {
                                  return ResultScreen(resultsList: results,);
                                }),
                              );
                            },
                            child: Text("Suchen",
                                style: styleButton),
                          ),
                        ),

                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



 }



