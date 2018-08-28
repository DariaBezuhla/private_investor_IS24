import 'package:flutter/material.dart';
import 'package:investors/search/search_criteria.dart';

void main() => runApp(Investors());

class Investors extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Private Investors Portal',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: SearchCriteria(),
      );
}
