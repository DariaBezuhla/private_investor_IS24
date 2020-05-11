import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(PrivateInvestors());

class PrivateInvestors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ImmoScout Private Investors',
      home: Home(),
    );
  }
}