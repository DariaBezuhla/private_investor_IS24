import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/transition/slederDirection.dart';
import 'expose/expose_content.dart';
import 'icons/system_icons_i_s_icons.dart';
import 'results/card/real_estate_object.dart';
import './constant.dart';
import './kostenrechner.dart';

class ExposeScreen extends StatefulWidget {
  final List<RealEstateObject> housesList;
  final int selectedIndex;

  const ExposeScreen({
    Key key,
    this.housesList,
    this.selectedIndex,
  }) : super(key: key);

  @override

  @override
  _ExposeScreenState createState() => _ExposeScreenState();

}



class _ExposeScreenState extends State<ExposeScreen>
    with TickerProviderStateMixin {
  //final RealEstateObject house;

  //const ExposeScreen({Key key, this.house}) : super(key: key);

  int currentIndex = 0;
  int offstageIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  ValueNotifier<SlideDirection> slideNotifier;

  AnimationController _slideLeftAnimation;
  Animation<Offset> heroSlide;
  Animation<Offset> offstageSlide;
  double contentSpacing;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;

    slideNotifier = ValueNotifier(slideDirection)
      ..addListener(() {
        setState(() {
          animate();
        });
      });

    _slideLeftAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          updateContents();
        }
      });
  }

  @override
  void dispose() {
    _slideLeftAnimation.dispose();
    slideNotifier.dispose();
    super.dispose();
  }

  void animate() {
    switch (slideNotifier.value) {
      case SlideDirection.leftToRight:
        heroSlide = Tween<Offset>(
          begin: Offset(0.0, 0.0),
          end: Offset(contentSpacing, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideLeftAnimation,
            curve: Curves.easeInOut,
          ),
        );

        offstageSlide = Tween<Offset>(
          begin: Offset(-contentSpacing, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideLeftAnimation,
            curve: Curves.easeInOut,
          ),
        );

        _slideLeftAnimation.forward(from: 0.0);
        break;
      case SlideDirection.rightToLeft:
        heroSlide = Tween<Offset>(
          begin: Offset(0.0, 0.0),
          end: Offset(-contentSpacing, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideLeftAnimation,
            curve: Curves.easeInOut,
          ),
        );

        offstageSlide = Tween<Offset>(
          begin: Offset(contentSpacing, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideLeftAnimation,
            curve: Curves.easeInOut,
          ),
        );

        _slideLeftAnimation.forward(from: 0.0);
        break;
      default:
        break;
    }
  }

  void updateContents() {
    switch (slideNotifier.value) {
      case SlideDirection.leftToRight:
        currentIndex =
            (currentIndex - 1).clamp(0, widget.housesList.length - 1);
        slideNotifier.value = SlideDirection.none;
        break;
      case SlideDirection.rightToLeft:
        currentIndex =
            (currentIndex + 1).clamp(0, widget.housesList.length - 1);
        slideNotifier.value = SlideDirection.none;
        break;
      default:
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    var iconArrowLeft = IconButton(
        icon: Icon(
          SystemIconsIS.is24_system_48px_chevron_left,
          size: 24,
          color: kGrey,
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
        });

    return Scaffold(
      appBar: AppBar(
        leading: iconArrowLeft,
        title: logo,
        backgroundColor: Colors.white,
      ),
      backgroundColor: kBackgroundLight,
      body:
          ExposeContent(
            house: widget.housesList[currentIndex],
          ),

      /*
      Stack(
        children: <Widget>[
          ExposeContent(
            house: widget.housesList[currentIndex],
          ),
        ],
      ),
       */

      /*Container(
        child: ListView(
          children: <Widget>[
            //Image -> later Image Slider
            Image.asset(
              "assets/objects/1.png",
            ),

            //intro info
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Container(
                transform: Matrix4.translationValues(0, -24.0, 0),
                decoration: BoxDecoration(
                  boxShadow: shadowMd,
                  borderRadius: BorderRadius.all(
                    Radius.circular(2),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(14),
                  //color: Colors.white,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "1-Zi-Etagenwohnung im Herzen von Schöneberg mit Balkon",
                        style: header4,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "13587 Berlin, Spandau (Spandau)",
                        style: styleText,
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
              ),
            ),

            //4 most important numbers
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                _buildInfoItem1("Kaufpreis", "745,900 €"),
                                SizedBox(height: 24),
                                _buildInfoItem1("Aktuelle Miete", "1500 €")
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                _buildInfoItem1("Preis pro m²", "5,187 €/m²"),
                                SizedBox(height: 24),
                                _buildInfoItem1("Hausgeld", "400 €")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),

            //rest of numbers
            Container(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: shadowMd,
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: kBackground))),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: <Widget>[
                                _buildInfoItem1("Nettorendite", "2.7 %"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: <Widget>[
                                _buildInfoItem1("Gesch. Kaltmiete", "730 €"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: <Widget>[
                                _buildInfoItem1("X-fache Miete", "29")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IntrinsicHeight(
                      child: Container(
                        padding: EdgeInsets.all(24),
                        child: Row(
                          children: <Widget>[
                            _buildInfoItem2(
                                "Mietpreis-\nentwicklung", "10.3 %", true),
                            VerticalDivider(
                              thickness: 1,
                              color: kBackground,
                            ),
                            _buildInfoItem2(
                                "Kaufpreis-\nentwicklung", "2.4 %", false)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //props
            Container(
              padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.spaceEvenly,
                  children: _buildInfoItem3([
                    "34m²",
                    "1 Zimmer",
                    "Aufzug",
                  ])),
            ),

            //calculator button
            FractionallySizedBox(
              widthFactor: 0.95,
              child: KostenrechnerButton(theme: "light"),
            ),

            //object description
            Container(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDescriptionItem('Objektbeschreibung',
                      'Bei dem Objekt handelt es sich um einen vollständig sanierten und gepflegten Altbau in zentral innerstädtischer Lage. Die großzügige, in Kürze bezugsfrei werdende Wo … '),
                  _buildDescriptionItem('Ausstattung',
                      'Bei dem Objekt handelt es sich um einen vollständig sanierten und gepflegten Altbau in zentral innerstädtischer Lage. Die großzügige, in Kürze bezugsfrei werdende Wo … '),
                  _buildDescriptionItem('Ort',
                      'Zur Beachtung: Die Bilder zeigen eine andere Wohnung in diesem Objekt und Hausteil mit der nahezu identischen Ausstattungsqualität und nahezu identischen räumlichen Aufteilung bzw. Wohnfläche.'),
                ],
              ),
            ),

            //maps
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Image.asset(
                "assets/images/maps.png",
              ),
            ),

            //contact
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              'Weitere Fragen zur Immobilie?',
                              style: header4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 24, bottom: 24),
                    child: ButtonTheme(
                      child: FlatButton(
                        color: kTeal,
                        textColor: kCharcoal,
                        padding: EdgeInsets.all(10.0),
                        onPressed: () {
                          /*...*/
                        },
                        child:
                            Text("Anbieter kontaktieren", style: styleButton),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ), */
    );
  }

  Container _buildInfoItem1(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Text(
            value,
            style: header4,
          ),
          Text(
            title,
            style: styleDescriptionText,
          )
        ],
      ),
    );
  }

  Expanded _buildInfoItem2(String title, String value, bool isPositive) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              isPositive
                  ? SystemIconsIS.is24_system_48px_arrow_up
                  : SystemIconsIS.is24_system_48px_arrow_down,
              color: isPositive ? Colors.green[700] : Colors.red[700],
              size: 20,
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                value,
                style: header4,
              ),
              Text(
                title,
                style: styleDescriptionText,
              )
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildInfoItem3(List<String> list) {
    return list
        .map(
          (e) => Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              e,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        )
        .toList();
  }

  Column _buildDescriptionItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*2*/
        Container(
          child: Row(
            children: [
              Container(
                color: kTeal,
                width: 5.0,
                height: 28.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 19, top: 14, right: 24, bottom: 10),
                  child: Text(
                    title,
                    style: header4,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 24,
            bottom: 14,
            right: 24,
          ),
          child: Text(
            description,
            style: styleText,
          ),
        ),
        Container(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
            child: Divider(color: kLightGrey)),
      ],
    );
  }
}
