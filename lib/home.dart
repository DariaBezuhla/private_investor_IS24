import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/icons/aditional_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'constant.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<Home> {
  int _currentIndex = 0;
  bool isPressed = false;
  bool _filtersAreVisible = false;
  bool _investFilters = false;
  bool _immobilieFilters = false;

  final String containerTitle =
      "Starte deine\n\n"
      "suche";

  final String containerDescription =
      "Hier findest du in Zukunft persönliche Empfehlungen und Neuigkeiten passend zu deinen Interessen";

  final String textContainerTitle =
      "Ein Eigenheim als\n\n"
      "Anlageobjekt";

  final String textContainerSubTitle =
      "Die Investition in Immobilien hat mehr als nur einen steuerlichen Vorteil.";

  final String textContainerContent =
      "So sind Immobilien als Kapitalanlage besonders bei Anlegern mit einem hohen Sicherheitsbedürfnis beliebt. Das liegt daran, dass man als Immobilieninvestor keine schwankenden Börsenkurse beobachten oder mit großen Preissprüngen rechnen muss. Ob zur mittelfristigen Kapitalsteigerung oder zur langfristigen Existenzsicherung im Rentenalter – Immobilien stellen für verschiedene Bedürfnisse eine lohnende Kapitalanlage dar.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/immoscout_logo.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              child: Image(image: AssetImage('images/ftor_gerade_gradient.jpg')),
            ),
            Container(
              margin: new EdgeInsets.only(top: 130.0),
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
              ),
            ),
            ListView(
              padding: new EdgeInsets.fromLTRB(
                0.0,
                MediaQuery.of(context).size.height * 0.06,
                0.0,
                MediaQuery.of(context).size.height * 0.03,
              ),
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Kapitalanlagen in Deutschland',
                          style: TextStyle(
                            fontFamily: 'MakeItSans',
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.062,
                            //25.0,
                            color: Color(0x0FF3333333),
                            //letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Der ',
                            style: TextStyle(
                              fontFamily: 'MakeItSans',
                              fontWeight: FontWeight.normal,
                              fontSize: MediaQuery.of(context).size.width * 0.038,
                              color: Color(0x0FF3333333),
                              letterSpacing: MediaQuery.of(context).size.width * 0.002,
                            ),
                          ),
                          Text(
                            'Marktführer:',
                            style: TextStyle(
                              backgroundColor: Color(0x0FF00FFD0),
                              fontFamily: 'MakeItSans',
                              fontWeight: FontWeight.normal,
                              fontSize: MediaQuery.of(context).size.width * 0.038,
                              color: Color(0x0FF3333333),
                              letterSpacing: MediaQuery.of(context).size.width * 0.002,
                            ),

                          ),
                          Text(
                            ' Die Nr.1 rund um',
                            style: TextStyle(
                              fontFamily: 'MakeItSans',
                              fontWeight: FontWeight.normal,
                              fontSize: MediaQuery.of(context).size.width * 0.038,
                              color: Color(0x0FF3333333),
                              letterSpacing: MediaQuery.of(context).size.width * 0.002,
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(height: 3),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Immobilien',
                          style: TextStyle(
                            fontFamily: 'MakeItSans',
                            fontWeight: FontWeight.normal,
                            fontSize: MediaQuery.of(context).size.width * 0.038,
                            color: Color(0x0FF3333333),
                            letterSpacing: MediaQuery.of(context).size.width * 0.002,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                          //height: MediaQuery.of(context).size.height * 0.74,
                          width: MediaQuery.of(context).size.width,
                          //height: 662.0,
                          //width: 500.0,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.045,
                              left: MediaQuery.of(context).size.height * 0.03,
                              right: MediaQuery.of(context).size.height * 0.03
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(containerTitle,
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height * 0.04,
                                  height: MediaQuery.of(context).size.height * 0.0006,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.025,
                              ),
                              AutoSizeText(
                                containerDescription,
                                minFontSize: MediaQuery.of(context).size.width * 0.0,
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: MediaQuery.of(context).size.height * 0.022,
                                  height: MediaQuery.of(context).size.height * 0.0013,
                                  color: Color(0x0FF5c5c5c),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.025,
                              ),
                              Text(
                                "Region",
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: MediaQuery.of(context).size.height * 0.017,
                                  height: MediaQuery.of(context).size.height * 0.0007,
                                  color: Color(0x0FF858585),
                                  //letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.012),
                              Theme(
                                data: new ThemeData(
                                  primaryColor: Color(0x0FF00FFd0),
                                  primaryColorDark: Color(0x0F00ffd0),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x0FFd6d6d6),
                                        ),
                                      ),
                                      labelText: 'Wo: Bezirk, Stadt oder Bundesland',
                                      labelStyle: TextStyle(
                                          color: Color(0x0FFADADAD),
                                          fontSize: MediaQuery.of(context).size.height * 0.014)
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.022
                              ),
                              Text("Realestate",
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: MediaQuery.of(context).size.height * 0.017,
                                  height: MediaQuery.of(context).size.height * 0.0007,
                                  color: Color(0x0FF858585),
                                  //letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.012
                              ),
                              Theme(
                                data: new ThemeData(
                                  primaryColor: Color(0x0FF00FFd0),
                                  primaryColorDark: Color(0x0F00ffd0),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      labelText: 'Wohnung',
                                      labelStyle: TextStyle(
                                          color: Color(0x0FFADADAD),
                                          fontSize: MediaQuery.of(context).size.height * 0.014)
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.022
                              ),
                              Text("Budget bis",
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: MediaQuery.of(context).size.height * 0.017,
                                  height: MediaQuery.of(context).size.height * 0.0007,
                                  color: Color(0x0FF858585),
                                  //letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                              Theme(
                                data: new ThemeData(
                                  primaryColor: Color(0x0FF00FFd0),
                                  primaryColorDark: Color(0x0F00ffd0),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      labelText: '100.000€',
                                      labelStyle: TextStyle(
                                          color: Color(0x0FFADADAD),
                                          fontSize: MediaQuery.of(context).size.height * 0.014)
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.024
                                  ),
                                  new SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.001,
                                    child: new Center(
                                      child: new Container(
                                        margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                                        height: MediaQuery.of(context).size.height * 0.001,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.025
                              ),
                              Container(
                                color: Colors.transparent,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    RawMaterialButton(
                                      constraints: BoxConstraints(),
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      child:
                                      (_filtersAreVisible == false) ?
                                      Icon(
                                        SystemIconsIS.is24_system_48px_add,
                                        color:kCharcoal,
                                        size: MediaQuery.of(context).size.height * 0.039,
                                      ) :
                                      Icon(
                                        AditionalIconsIS.additional_icons_48px_forbidden,
                                        color: kCharcoal,
                                        size: MediaQuery.of(context).size.height * 0.039,
                                      ),
                                      onPressed: showFilters,
                                    ),
                                    Text("Weitere Filter",
                                      style: TextStyle(
                                        backgroundColor: Colors.transparent,
                                        fontFamily: 'MakeItSans',
                                        fontWeight: FontWeight.bold,
                                        fontSize: MediaQuery.of(context).size.height * 0.023,
                                        color: Color(0x0FF333333),
                                      ),
                                    ),
                                    (_filtersAreVisible == false) ?
                                    Icon(
                                      SystemIconsIS.is24_system_48px_chevron_down,
                                      size: MediaQuery.of(context).size.width * 0.07,
                                    ) :
                                    Icon (SystemIconsIS
                                        .is24_system_48px_chevron_up,
                                      color: Color(0x0FF333333),
                                      size: MediaQuery.of(context).size.height * 0.030,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.width * 0.025
                              ),

                             //weitere filter, part that drops down
                             //immobilie and investitionen filters are visible
                              Visibility(
                                visible: _filtersAreVisible, //false
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Container(    //new visibility
                                            color: Colors.transparent,
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Text("Investitionen",
                                                      style: TextStyle(
                                                        backgroundColor: Colors.transparent,
                                                        fontFamily: 'MakeItSans',
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: MediaQuery.of(context).size.height * 0.023,
                                                        color: Color(0x0FF333333),
                                                      ),
                                                    ),
                                                    RawMaterialButton(
                                                      constraints: BoxConstraints(),
                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                      child:
                                                      (_investFilters ==  false) ?
                                                      Icon(
                                                        SystemIconsIS.is24_system_48px_chevron_down,
                                                        size: MediaQuery.of(context).size.height * 0.030,
                                                      ) :
                                                      Icon (SystemIconsIS
                                                          .is24_system_48px_chevron_up,
                                                        color: Color(0x0FF333333),
                                                        size: MediaQuery.of(context).size.height * 0.030,
                                                      ),
                                                      onPressed: showInvestFilters,
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.015),
                                                  child: new SizedBox(
                                                    height: MediaQuery.of(context).size.height * 0.001,
                                                    child: new Center(
                                                      child: new Container(
                                                        margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                                                        height: MediaQuery.of(context).size.height * 0.001,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),

                                          //Investitionen Visibility
                                          Visibility(
                                            visible: _investFilters, //false
                                            child: Stack(
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.width * 0.0263
                                                    ),
                                                    Container(
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          "Nettorendite ab",
                                                          style: TextStyle(
                                                            backgroundColor: Colors.transparent,
                                                            fontFamily: 'MakeItSans',
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: MediaQuery.of(context).size.height * 0.017,
                                                            height: MediaQuery.of(context).size.height * 0.0007,
                                                            color: Color(0x0FF858585),
                                                            //letterSpacing: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.height * 0.012),
                                                    Theme(
                                                      data: new ThemeData(
                                                        primaryColor: Color(0x0FF00FFd0),
                                                        primaryColorDark: Color(0x0F00ffd0),
                                                      ),
                                                      child: TextFormField(
                                                        decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color(0x0FFd6d6d6),
                                                              ),
                                                            ),
                                                            labelText: 'z.B. ab 3,00%',
                                                            labelStyle: TextStyle(
                                                                color: Color(0x0FFADADAD),
                                                                fontSize: MediaQuery.of(context).size.height * 0.014)
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.width * 0.05
                                                    ),
                                                    Container(
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          "Kaufpreisentwicklung",
                                                          style: TextStyle(
                                                            backgroundColor: Colors.transparent,
                                                            fontFamily: 'MakeItSans',
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: MediaQuery.of(context).size.height * 0.017,
                                                            height: MediaQuery.of(context).size.height * 0.0007,
                                                            color: Color(0x0FF858585),
                                                            //letterSpacing: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.height * 0.012),
                                                    Theme(
                                                      data: new ThemeData(
                                                        primaryColor: Color(0x0FF00FFd0),
                                                        primaryColorDark: Color(0x0F00ffd0),
                                                      ),
                                                      child: TextFormField(
                                                        decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color(0x0FFd6d6d6),
                                                              ),
                                                            ),
                                                            labelText: 'z.B. ab 5%',
                                                            labelStyle: TextStyle(
                                                                color: Color(0x0FFADADAD),
                                                                fontSize: MediaQuery.of(context).size.height * 0.014)
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.width * 0.05
                                                    ),
                                                    Container(
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          "Mietpreisentwicklung",
                                                          style: TextStyle(
                                                            backgroundColor: Colors.transparent,
                                                            fontFamily: 'MakeItSans',
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: MediaQuery.of(context).size.height * 0.017,
                                                            height: MediaQuery.of(context).size.height * 0.0007,
                                                            color: Color(0x0FF858585),
                                                            //letterSpacing: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.height * 0.012),
                                                    Theme(
                                                      data: new ThemeData(
                                                        primaryColor: Color(0x0FF00FFd0),
                                                        primaryColorDark: Color(0x0F00ffd0),
                                                      ),
                                                      child: TextFormField(
                                                        decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color(0x0FFd6d6d6),
                                                              ),
                                                            ),
                                                            labelText: 'z.B. ab 5%',
                                                            labelStyle: TextStyle(
                                                                color: Color(0x0FFADADAD),
                                                                fontSize: MediaQuery.of(context).size.height * 0.014)
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.width * 0.05
                                                    ),
                                                    Container(
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          "Faktor",
                                                          style: TextStyle(
                                                            backgroundColor: Colors.transparent,
                                                            fontFamily: 'MakeItSans',
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: MediaQuery.of(context).size.height * 0.017,
                                                            height: MediaQuery.of(context).size.height * 0.0007,
                                                            color: Color(0x0FF858585),
                                                            //letterSpacing: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.height * 0.012),
                                                    Theme(
                                                      data: new ThemeData(
                                                        primaryColor: Color(0x0FF00FFd0),
                                                        primaryColorDark: Color(0x0F00ffd0),
                                                      ),
                                                      child: TextFormField(
                                                        decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color(0x0FFd6d6d6),
                                                              ),
                                                            ),
                                                            labelText: 'z.B. bis 10',
                                                            labelStyle: TextStyle(
                                                                color: Color(0x0FFADADAD),
                                                                fontSize: MediaQuery.of(context).size.height * 0.014)
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.width * 0.05
                                                    ),
                                                    Container(
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          "Preis pro m2",
                                                          style: TextStyle(
                                                            backgroundColor: Colors.transparent,
                                                            fontFamily: 'MakeItSans',
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: MediaQuery.of(context).size.height * 0.017,
                                                            height: MediaQuery.of(context).size.height * 0.0007,
                                                            color: Color(0x0FF858585),
                                                            //letterSpacing: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.height * 0.012),
                                                    Theme(
                                                      data: new ThemeData(
                                                        primaryColor: Color(0x0FF00FFd0),
                                                        primaryColorDark: Color(0x0F00ffd0),
                                                      ),
                                                      child: TextFormField(
                                                        decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color(0x0FFd6d6d6),
                                                              ),
                                                            ),
                                                            labelText: 'z.B. bis 600€',
                                                            labelStyle: TextStyle(
                                                                color: Color(0x0FFADADAD),
                                                                fontSize: MediaQuery.of(context).size.height * 0.014)
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.height * 0.012),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.015,
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.001,
                                          ),
                                          Container(
                                            color: Colors.transparent,
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Text("Immobilie",
                                                      style: TextStyle(
                                                        backgroundColor: Colors.transparent,
                                                        fontFamily: 'MakeItSans',
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: MediaQuery.of(context).size.height * 0.023,
                                                        color: Color(0x0FF333333),
                                                      ),
                                                    ),
                                                    RawMaterialButton(
                                                      constraints: BoxConstraints(),
                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                      child:
                                                      (_immobilieFilters ==  false) ?
                                                      Icon(
                                                        SystemIconsIS.is24_system_48px_chevron_down,
                                                        size: MediaQuery.of(context).size.height * 0.030,
                                                      ) :
                                                      Icon (SystemIconsIS
                                                          .is24_system_48px_chevron_up,
                                                        color: Color(0x0FF333333),
                                                        size: MediaQuery.of(context).size.height * 0.030,
                                                      ),
                                                      onPressed: showImmobilieFilters,
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.015),
                                                  child: new SizedBox(
                                                    height: MediaQuery.of(context).size.height * 0.001,
                                                    child: new Center(
                                                      child: new Container(
                                                        margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                                                        height: MediaQuery.of(context).size.height * 0.001,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),

                                          //Immobilie Visibility
                                          Visibility(
                                            visible: _immobilieFilters, //false
                                            child: Stack(
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.width * 0.0263
                                                    ),
                                                    Container(
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          "Zimmer",
                                                          style: TextStyle(
                                                            backgroundColor: Colors.transparent,
                                                            fontFamily: 'MakeItSans',
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: MediaQuery.of(context).size.height * 0.017,
                                                            height: MediaQuery.of(context).size.height * 0.0007,
                                                            color: Color(0x0FF858585),
                                                            //letterSpacing: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.height * 0.012),
                                                    Theme(
                                                      data: new ThemeData(
                                                        primaryColor: Color(0x0FF00FFd0),
                                                        primaryColorDark: Color(0x0F00ffd0),
                                                      ),
                                                      child: TextFormField(
                                                        decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color(0x0FFd6d6d6),
                                                              ),
                                                            ),
                                                            labelText: 'Zimmer egal',
                                                            labelStyle: TextStyle(
                                                                color: Color(0x0FFADADAD),
                                                                fontSize: MediaQuery.of(context).size.height * 0.014)
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.width * 0.05
                                                    ),
                                                    Container(
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          "Größe",
                                                          style: TextStyle(
                                                            backgroundColor: Colors.transparent,
                                                            fontFamily: 'MakeItSans',
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: MediaQuery.of(context).size.height * 0.017,
                                                            height: MediaQuery.of(context).size.height * 0.0007,
                                                            color: Color(0x0FF858585),
                                                            //letterSpacing: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.height * 0.012),
                                                    Theme(
                                                      data: new ThemeData(
                                                        primaryColor: Color(0x0FF00FFd0),
                                                        primaryColorDark: Color(0x0F00ffd0),
                                                      ),
                                                      child: TextFormField(
                                                        decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color(0x0FFd6d6d6),
                                                              ),
                                                            ),
                                                            labelText: 'z.B. ab 100 m2',
                                                            labelStyle: TextStyle(
                                                                color: Color(0x0FFADADAD),
                                                                fontSize: MediaQuery.of(context).size.height * 0.014)
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(context).size.height * 0.012),
                                                   new SizedBox(
                                                     height: MediaQuery
                                                         .of(context)
                                                         .size
                                                         .height * 0.001,
                                                     child: new Center(
                                                       child: new Container(
                                                         margin: new EdgeInsetsDirectional
                                                             .only(start: 1.0,
                                                             end: 1.0),
                                                         height: MediaQuery
                                                             .of(context)
                                                             .size
                                                             .height * 0.001,
                                                         color: Colors.grey,
                                                       ),
                                                     ),
                                                   ),
                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: !_filtersAreVisible,
                                child: new SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.001,
                                  child: new Center(
                                    child: new Container(
                                      margin: new EdgeInsetsDirectional.only(
                                          start: 1.0, end: 1.0),
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.001,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.015,
                              ),
                              Container(
                                //padding: const EdgeInsets.only(left: 24, bottom: 24),
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
                                    child: Text("Suchen",
                                        style: styleButton),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          //height: MediaQuery.of(context).size.height/2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
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
                          //height: MediaQuery.of(context).size.height * 0.62,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.045,
                              left: MediaQuery.of(context).size.height * 0.03,
                              right: MediaQuery.of(context).size.height * 0.03
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                textContainerTitle,
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height * 0.04,
                                  height: MediaQuery.of(context).size.height * 0.0006,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.025,
                              ),
                              AutoSizeText(
                                textContainerSubTitle,
                                minFontSize: MediaQuery.of(context).size.width * 0.0,
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: MediaQuery.of(context).size.height * 0.022,
                                  height: MediaQuery.of(context).size.height * 0.0013,
                                  color: Color(0x0FF5c5c5c),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.025,
                              ),
                              AutoSizeText(
                                textContainerContent,
                                minFontSize: MediaQuery.of(context).size.width * 0.0,
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: MediaQuery.of(context).size.height * 0.017,
                                  height: MediaQuery.of(context).size.height * 0.0014,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.025,
                              ),
                              Container(
                                  child: new SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.001,
                                    child: new Center(
                                      child: new Container(
                                        margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                                        height: MediaQuery.of(context).size.height * 0.001,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )
                              ),
                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.03,
                              ),
                              Container(
                                //padding: const EdgeInsets.only(left: 24, bottom: 24),
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
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int _currentIndex) {
          setState(() {
            this._currentIndex = _currentIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(SystemIconsIS.is24_system_48px_search,
              size: MediaQuery.of(context).size.width * 0.09,
              color: Colors.black,
            ),
            activeIcon: new Image.asset("images/search@3x.png"),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(
              SystemIconsIS.is24_system_48px_heart_favorite,
              size: MediaQuery.of(context).size.width * 0.09,
              color: Colors.black,
            ),
            activeIcon: new Image.asset("images/heart@3x.png"),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(
              SystemIconsIS.is24_system_48px_settings,
              size: MediaQuery.of(context).size.width * 0.09,
              color: Colors.black,
            ),
            activeIcon: new Image.asset("images/settings@3x.png"),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void showFilters() {
    setState(() {
      _filtersAreVisible = !_filtersAreVisible;
    });
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
}
