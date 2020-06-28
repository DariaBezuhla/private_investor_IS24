import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import 'package:privateinvestorsmobile/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant.dart';
import '../../home.dart';

class NoResultsFound extends StatelessWidget {

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
                    'assets/images/no_results_light.png',
                  ),
                ),
              ),
              Text('No results found', style: CustomStyle.header4(context)),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              Text('Try adjusting your search', style: CustomStyle.styleButton(context)),
              Text('to find what you are looking for', style: CustomStyle.styleButton(context)),
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
                    child: Text('Adjust search',
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