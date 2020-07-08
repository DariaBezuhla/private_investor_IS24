import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/calculator.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import '../constant.dart';
import '../icons/product_icons_i_s_icons.dart';
import 'package:easy_localization/easy_localization.dart';

final String assetName = 'assets/icons/calculator.svg';

class Others extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'MakeItSans',
          primaryColor: kTeal,
          primaryColorDark: kCharcoal,
          accentColor: kCharcoal),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KostenrechnerButton(
                  theme: "light",
                ),
                KostenrechnerButton(
                  theme: "dark",
                ),
                OfflineButton(
                  theme: "light",
                ),
                OfflineButton(
                  theme: "dark",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KostenrechnerButton extends StatefulWidget {
  final String theme;
  final fetchedKaltmiete;
  final exposeId;

  const KostenrechnerButton({Key key, this.theme, this.fetchedKaltmiete, this.exposeId}) : super(key: key);

  @override
  _KostenrechnerState createState() => _KostenrechnerState();
}

class _KostenrechnerState extends State<KostenrechnerButton> {
  var welcheKosten = 'WelcheKosten'.tr().toString();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(150),
      child: Card(
          color: kTeal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  color: widget.theme == "light" ? Colors.white : kCharcoal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        ProductIconsIS.is24_product_48px_calculator,
                        color: kGrey,
                        size: ScreenUtil().setWidth(24),
                      ),
                      //is24_product_48px_calculator
                      /*SvgPicture.asset(assetName,
                          semanticsLabel: 'Calculator', color: kGrey),
                       */
                      Text(welcheKosten,
                        style: TextStyle(
                            fontSize: ScreenUtil().setHeight(16),
                            color: widget.theme == "light" ? kCharcoal : kGrey),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Zum Kostenrechner'.tr().toString(), style: CustomStyle.styleButton(context)),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteGenerator(builder: (context) {
                        return Calculator(fetchedKaltmiete: widget.fetchedKaltmiete, exposeId: widget.exposeId);
                      }),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}

class OfflineButton extends StatefulWidget {
  final String theme;

  const OfflineButton({Key key, this.theme}) : super(key: key);

  @override
  _OfflineButtonState createState() => _OfflineButtonState();
}

class _OfflineButtonState extends State<OfflineButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(350),
      height: ScreenUtil().setWidth(150),
      child: Card(
        color: widget.theme == "light" ? Colors.white : kCharcoal,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.cloud_off,
                      size: ScreenUtil().setWidth(50),
                      color: kGrey),
                  Text(
                    "Offline".tr().toString(),
                    style: TextStyle(
                        fontSize: ScreenUtil().setHeight(20),
                        color: widget.theme == "light" ? kCharcoal : kGrey),
                  )
                ],
              ),
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(20),
                        vertical: ScreenUtil().setHeight(10)),
                    child: Text('Erneut versuchen'.tr().toString(), style: TextStyle(fontSize: ScreenUtil().setHeight(20))),
                    onPressed: () {},
                    color: kTeal)
              ],
            )
          ],
        ),
      ),
    );
  }
}