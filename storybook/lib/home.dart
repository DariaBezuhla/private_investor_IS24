import 'package:flutter/material.dart';
import 'icons/system_icons_i_s_icons.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<Home> {
  int _currentIndex = 0;

  final String containerTitle =
      "Starte deine\n\n"
      "suche";

  final String containerDescription =
      "Hier findest du in Zukunft\n\n"
      "persönliche Empfehlungen\n\n"
      "und Neuigkeiten passend zu\n\n"
      "deinen Interessen\n\n";

  final String textContainerTitle =
      "Ein Eigenheim als\n\n"
      "Anlageobjekt";

  final String textContainerSubTitle =
      "Die Investition in Immobilien\n\n"
      "hat mehr als nur einen\n\n"
      "steuerlichen Vorteil.";

  final String textContainerContent =
      "So sind Immobilien als Kapitalanlage\n\n"
      "besonders bei Anlegern mit einem\n\n"
      "hohen Sicherheitsbedürfnis beliebt.\n\n"
      "Das liegt daran, dass man als\n\n"
      "Immobilieninvestor keine\n\n"
      "schwankenden Börsenkurse\n\n"
      "beobachten oder mit großen\n\n"
      "Preissprüngen rechnen muss. Ob zur\n\n"
      "mittelfristigen Kapitalsteigerung oder\n\n"
      "zur langfristigen Existenzsicherung im\n\n"
      "Rentenalter – Immobilien stellen für\n\n"
      "verschiedene Bedürfnisse eine\n\n"
      "lohnende Kapitalanlage dar.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo/logo.png',
              fit: BoxFit.cover,
              height: 35.0,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              child: Image(image: AssetImage('assets/images/ftor_gerade.jpg')),
              //height: 300.0,
              //constraints: BoxConstraints.expand(height: 300.0),
            ),
            Container(
              //for image opacity
              color: Color.fromRGBO(144, 180, 200, 0.4),
              height: 200.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Kapitalanlagen in Deutschland',
                        style: TextStyle(
                        fontFamily: 'MakeItSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0x0FF3333333),
                          //letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Der ',
                          style: TextStyle(
                          fontFamily: 'MakeItSans',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color(0x0FF3333333),
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        'Marktführer:',
                        style: TextStyle(
                          backgroundColor: Color(0x0FF00FFD0),
                          fontFamily: 'MakeItSans',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color(0x0FF3333333),
                          letterSpacing: 0.5,
                        ),

                      ),
                      Text(
                        ' Die Nr.1 rund um',
                        style: TextStyle(
                          fontFamily: 'MakeItSans',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color(0x0FF3333333),
                          letterSpacing: 0.5,
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
                        fontSize: 15,
                        color: Color(0x0FF3333333),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: new EdgeInsets.only(top: 130.0),
              height: 150.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.white12,
                    Colors.white,
                  ],
                  stops: [0.1, 0.5],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.repeated,
                )
              ),
            ),
            ListView(
              padding: new EdgeInsets.fromLTRB(0.0, 180.0, 0.0, 32.0),
              children: <Widget>[
                Container(
                  padding: new EdgeInsets.symmetric(horizontal: 32.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        elevation: 2.0,
                        shadowColor: Colors.grey,
                        borderRadius: BorderRadius.circular(3.0),
                        child: Container(
                          height: 645.0,
                          width: 500.0,
                          margin: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(containerTitle,
                                  style: TextStyle(
                                    backgroundColor: Colors.transparent,
                                    fontFamily: 'MakeItSans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                    height: 0.6,
                                    color: Colors.black,
                                    //letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Text(
                                containerDescription,
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  height: 0.6,
                                  color: Color(0x0FF5c5c5c),
                                  //letterSpacing: 0.5,
                                ),
                              ),
                              Text(
                                "Region",
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  height: 0.6,
                                  color: Color(0x0FF858585),
                                  //letterSpacing: 0.5,
                                ),
                              ),
                            SizedBox(
                                height: 10.0),
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
                                              color: Color(0x0FFADADAD), fontSize: 13.0)
                                      ),
                                      ),
                            ),
                              SizedBox(
                                  height: 22.0
                              ),
                              Text("Realestate",
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.normal,
                                  fontSize:15,
                                  height: 0.6,
                                  color: Color(0x0FF858585),
                                  //letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(
                                  height: 10.0
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
                                          color: Color(0x0FFADADAD), fontSize: 13.0)
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: 22.0
                              ),
                              Text("Budget bis",
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  height: 0.6,
                                  color: Color(0x0FF858585),
                                  //letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 10.0),
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
                                          color: Color(0x0FFADADAD), fontSize: 13.0)
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: 20.0
                              ),
                              Container(
                                child: Center(
                                    child: CustomPaint(
                                        painter: HorizontalLine()))
                              ),
                              SizedBox(
                                  height: 25.0
                              ),
                              Container(
                                color: Colors.transparent,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      SystemIconsIS.is24_system_48px_add,
                                      size: 30.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0),
                                      child: Text("Weitere Filter",
                                        style: TextStyle(
                                          backgroundColor: Colors.transparent,
                                          fontFamily: 'MakeItSans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color(0x0FF333333),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 85.0),
                                      child: Icon(
                                        SystemIconsIS.is24_system_48px_chevron_down,
                                        size: 30.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: 25.0
                              ),
                              Container(
                                  child: Center(
                                      child: CustomPaint(
                                          painter: HorizontalLine()))
                              ),
                              SizedBox(
                                  height: 20.0
                              ),
                              ButtonTheme(
                                minWidth: double.infinity,
                                child: FlatButton(
                                  color: Color(0x0FF00FFD0),
                                  textColor: Color(0xFF333333),
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  padding: EdgeInsets.all(8.0),
                                  splashColor: Colors.blueAccent,
                                  onPressed: () {
                                    /*...*/
                                  },
                                  child: Text(
                                    "SUCHEN",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'MakeItSans',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          //height: MediaQuery.of(context).size.height/2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: new EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        elevation: 2.0,
                        shadowColor: Colors.grey,
                        borderRadius: BorderRadius.circular(3.0),
                        child: Container(
                          height: 645.0,
                          width: 500.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 40.0, horizontal: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                textContainerTitle,
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  height: 0.6,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Text(
                                textContainerSubTitle,
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  height: 0.6,
                                  color: Color(0x0FF5c5c5c),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                textContainerContent,
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontFamily: 'MakeItSans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  height: 0.8,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Container(
                                  child: Center(
                                      child: CustomPaint(
                                          painter: HorizontalLine()))
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              ButtonTheme(
                                minWidth: double.infinity,
                                child: FlatButton(
                                  color: Color(0x0FF00FFD0),
                                  textColor: Color(0xFF333333),
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  padding: EdgeInsets.all(8.0),
                                  splashColor: Colors.blueAccent,
                                  onPressed: () {
                                    /*...*/
                                  },
                                  child: Text(
                                    "SUCHEN",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'MakeItSans',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                                ),
                              )
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
              size: 40.0,
              color: Colors.black,
            ),
            activeIcon: new Image.asset("assets/images/search@3x.png"),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(
              SystemIconsIS.is24_system_48px_heart_favorite,
              size: 40.0,
              color: Colors.black,
            ),
            activeIcon: new Image.asset("assets/images/heart@3x.png"),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(
              SystemIconsIS.is24_system_48px_settings,
              size: 40.0,
              color: Colors.black,
            ),
            activeIcon: new Image.asset("assets/images/settings@3x.png"),
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
}

class HorizontalLine extends CustomPainter {
  Paint _paint;

  HorizontalLine() {
    _paint = Paint()
      ..color = Color(0x0FFADADAD)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(-145.0, 0.0), Offset(145.0, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}