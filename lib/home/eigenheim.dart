import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'horizontal_line.dart';

class Eigenheim extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _EigenheimPage();
  }
}

 class _EigenheimPage extends State<Eigenheim> {

   final String textContainerTitle =
       "Ein Eigenheim als\n\n"
       "Anlageobjekt";

   final String textContainerSubTitle =
       "Die Investition in Immobilien hat mehr als nur einen steuerlichen Vorteil.";

   final String textContainerContent =
       "So sind Immobilien als Kapitalanlage besonders bei Anlegern mit einem hohen Sicherheitsbedürfnis beliebt. Das liegt daran, dass man als Immobilieninvestor keine schwankenden Börsenkurse beobachten oder mit großen Preissprüngen rechnen muss. Ob zur mittelfristigen Kapitalsteigerung oder zur langfristigen Existenzsicherung im Rentenalter – Immobilien stellen für verschiedene Bedürfnisse eine lohnende Kapitalanlage dar.";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.03),
      child: Column(
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
                  Text(
                    textContainerTitle,
                    style: styleContainerDescription,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AutoSizeText(
                    textContainerSubTitle,
                    minFontSize: MediaQuery.of(context).size.width * 0.0,
                    style: styleContainerDescription2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AutoSizeText(
                    textContainerContent,
                    minFontSize: MediaQuery.of(context).size.width * 0.0,
                    style: styleContainerContent,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),

                  HorizontalLine(),

                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.03,
                  ),

                  Container(
                    padding: EdgeInsets.only(bottom: MediaQuery
                        .of(context)
                        .size
                        .height * 0.025),
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      child: FlatButton(
                        color: kTeal,
                        textColor: kCharcoal,
                        padding: EdgeInsets.all(10.0),
                        onPressed: () {
                          /*...*/
                        },
                        child: Text("Zum Finanzierungsrechner",
                            style: styleButton),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
 }