import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import '../constant.dart';

//AppBar with icon ArrowLeft
class AppBarWithArrow extends StatelessWidget implements PreferredSizeWidget  {

  const AppBarWithArrow({Key key})
      : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {

    var iconArrowLeft = IconButton(
        icon: Icon(
          SystemIconsIS.is24_system_48px_chevron_left,
          size: ScreenUtil().setWidth (24),
          color: kIcon,
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
        });

    return AppBar(
      leading: iconArrowLeft,
      title: Center(child: logo),
      backgroundColor: kHeaderFooter,
      elevation: 2,
      actions: <Widget>[
        new Container(
          width: 56,
          //height: 56,
        ),
      ],
    );
  }
}