import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../../theme.dart';

class SearchButton extends StatefulWidget {
  SearchButton({Key key}) : super(key: key);

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getDisplayTheme(context);

    var buttonWidth = (MediaQuery.of(context).size.width - 48.0) / 2;

    return ButtonTheme(
      minWidth: buttonWidth,
      height: 30,
      child: RaisedButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        color: kTeal,
        child: Text(
          'Suche bearbeiten'.tr().toString(),
          style: theme.textTheme.bodyText2,
        ),
        onPressed: () {
          /* 'Suche bearbeiten' Window open with all filters from Home() */
        },
      ),
    );
  }
}
