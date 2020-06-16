import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/home.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant.dart';
import 'package:easy_localization/easy_localization.dart';

final String containerTitle = 'containerTitle'.tr().toString();
final String checkoutText1 = 'checkoutText1'.tr().toString();
final String checkoutText2 = 'checkoutText2'.tr().toString();

class NoSavedItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(10),
          horizontal: ScreenUtil().setWidth(10)),
      child: Card(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(50),
                    horizontal: ScreenUtil().setWidth(14)),
                child: Image(
                  image: AssetImage(
                    'assets/images/wishlist_light.png',
                  ),
                ),
              ),
              Text('Keine gespeicherte Objekte'.tr().toString(), style: CustomStyle.header4(context)),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              Text(checkoutText1, style: CustomStyle.styleButton(context)),
              Text(checkoutText2, style: CustomStyle.styleButton(context)),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(50)),
                child: Builder(
                  builder: (context) => FlatButton(
                    color: kTeal,
                    textColor: kCharcoal,
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10),
                        horizontal: ScreenUtil().setWidth(10)),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteGenerator(builder: (context) {
                          return Home();
                        }),
                      );
                    },
                    child: Text(containerTitle,
                        style: CustomStyle.styleButton(context)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}