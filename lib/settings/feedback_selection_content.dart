import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../constant.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackSelectionContent extends StatefulWidget {
  final String theme;
  const FeedbackSelectionContent({
    Key key,
    this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {}

  @override
  _FeedbackSelectionContentState createState() =>
      _FeedbackSelectionContentState();
}

class _FeedbackSelectionContentState extends State<FeedbackSelectionContent> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getTheme();

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
                      "Feedback".tr().toString(),
                      style: CustomStyle.header3(context),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      const url =
                          'https://service.immobilienscout24.de/prechatform?endpoint=https%3A%2F%2F2uafm.la1-c2-frf.salesforceliveagent.com%2Fcontent%2Fs%2Fchat%3Flanguage%3Dde%26org_id%3D00D20000000LpzO%26deployment_id%3D572w00000004Fa1%23deployment_id%3D572w00000004Fa1%26org_id%3D00D20000000LpzO%26button_id%3D5731r000000gBHT&fbclid=IwAR3dKxbexT-4-XSScULaqOG342BtUvLqAoHjDmf5F9lmmBbS0e6Q9pk7hY8';

                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: false);
                      } else {
                        await launch(url, forceSafariVC: true);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Live Chat".tr().toString(),
                            style: CustomStyle.styleText(context),
                          ),
                          IconTheme(
                            data: theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Divider(color: theme.dividerColor),
                  ),
                  GestureDetector(
                    onTap: () async {
                      String telephoneUrl = "tel:+4930243011200";

                      if (await canLaunch(telephoneUrl)) {
                        await launch(telephoneUrl);
                      } else {
                        throw "Can't phone that number.";
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Support anrufen".tr().toString(),
                            style: CustomStyle.styleText(context),
                          ),
                          IconTheme(
                            data: theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                // padding: EdgeInsets.symmetric(
                //   vertical: ScreenUtil().setHeight(12),
                // ),
                child: Divider(color: theme.dividerColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
