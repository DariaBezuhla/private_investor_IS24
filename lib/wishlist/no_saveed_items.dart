import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/home.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant.dart';
import '../constant.dart';

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
              Text('No saved objekts', style: CustomStyle.header4(context)),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              Text('''Check out our latest results for you 
             and save them for later! ''', style: styleText),
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
                    child: Text('Start searching',
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
