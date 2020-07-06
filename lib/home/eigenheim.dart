import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant.dart';
import 'package:easy_localization/easy_localization.dart';

class Eigenheim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EigenheimPage();
  }
}

class _EigenheimPage extends State<Eigenheim> {
  final String textContainerTitle = 'textContainerTitle'.tr().toString();

  final String textContainerSubTitle =  'textContainerSubTitle'.tr().toString();

  final String textContainerContent = 'textContainerContent'.tr().toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
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
              margin: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(24),
                  vertical: ScreenUtil().setHeight(24)),

              //MAIN CONTAINER
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    textContainerTitle,
                    style: CustomStyle.header1(context),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    textContainerSubTitle,
                    style: CustomStyle.styleBigText(context),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(24),
                  ),
                  Text(
                    textContainerContent,
                    style: CustomStyle.styleText(context),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
