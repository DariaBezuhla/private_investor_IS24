import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/theme.dart';
import 'package:provider/provider.dart';
import 'package:privateinvestorsmobile/main.dart';

import '../constant.dart';

class LanguageSelectionContent extends StatefulWidget {
  final ThemeData theme;
  const LanguageSelectionContent({
    Key key,
    this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {}

  @override
  _LanguageSelectionContentState createState() =>
      _LanguageSelectionContentState();
}

class _LanguageSelectionContentState extends State<LanguageSelectionContent> {
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
                      "Sprachauswahl".tr().toString(),
                      style: CustomStyle.header3(context),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        EasyLocalization.of(context).locale = Locale('de');
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrivateInvestors(theme:theme )));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Deutsch".tr().toString(),
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
                    onTap: () {
                      setState(() {
                        EasyLocalization.of(context).locale = Locale('en');
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrivateInvestors(theme:theme )));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Englisch".tr().toString(),
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
