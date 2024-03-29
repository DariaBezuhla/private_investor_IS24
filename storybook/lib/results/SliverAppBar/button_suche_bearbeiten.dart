
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class SearchButton extends StatefulWidget {
  SearchButton({Key key}) : super(key: key);

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {

  @override
  Widget build(BuildContext context) {
    var buttonWidth = (MediaQuery.of(context).size.width - 48.0)/2;

    return
      ButtonTheme(
        minWidth: buttonWidth,
        height: 30,
        child:RaisedButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          color: kTeal,
          child: Text(
            'Suche bearbeiten',
            style: styleButton,
          ),
          onPressed: () {},
        ),
      );
  }
}