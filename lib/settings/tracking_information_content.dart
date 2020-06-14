import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../constant.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../main.dart';

class TrackingInformationContent extends StatefulWidget {
  final String theme;
  const TrackingInformationContent({
    Key key,
    this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {}

  @override
  _TrackingInformationContentState createState() =>
      _TrackingInformationContentState();
}

class _TrackingInformationContentState
    extends State<TrackingInformationContent> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getTheme();
    bool isSwitched = false;

    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24)),
          // Settings
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    child: Text(
                      "Tracking Information".tr().toString(),
                      style: CustomStyle.header3(context),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(),
                            child: Text(
                              'trackingText'.tr().toString(),
                              style: CustomStyle.styleText(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Divider(color: theme.dividerColor),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(),
                            child: Text(
                              'Daten senden'.tr().toString(),
                              style: CustomStyle.styleText(context),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(24)),
                          child: FlutterSwitch(
                            activeColor: kTeal,
                            inactiveColor: kGrey,
                            toggleSize: ScreenUtil().setHeight(17),
                            height: ScreenUtil().setHeight(20),
                            width: ScreenUtil().setWidth(50),
                            value: isSwitched,
                            onToggle: (value) {
                              setState(() {
                                isSwitched = !isSwitched;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: Divider(color: theme.dividerColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
