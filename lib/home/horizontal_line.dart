import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.001,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional
                .only(start: 1.0,
                end: 1.0),
            height: MediaQuery
                .of(context)
                .size
                .height * 0.001,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
