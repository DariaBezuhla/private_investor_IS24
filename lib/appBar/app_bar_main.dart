import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

//AppBar without iconArrowLeft for Home()
class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: Center(child: logo),
      leading: new Container(),
      backgroundColor: kHeaderFooter,
      elevation: elevation,
      actions: <Widget>[
        new Container(
          width: 56,
          height: 56,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(56);
}