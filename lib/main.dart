import 'package:flutter/material.dart';
import 'package:investors/search/search_criteria.dart';

void main() => runApp(new Investors());

class Investors extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(
        title: 'Private Investors Portal',
        theme: new ThemeData(
          primaryColor: Colors.blue,
        ),
        home: new SearchCriteria(),
      );
}
