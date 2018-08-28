import 'package:flutter/material.dart';
import 'package:investors/search/Location.dart';

class ResultList extends StatefulWidget {
  final Location _location;

  ResultList(this._location);

  @override
  State<StatefulWidget> createState() => ResultListState(_location);
}

class ResultListState extends State<ResultList> {
  final Location _location;

  ResultListState(this._location);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Results for ${_location.label}"),
        ),
        body: SafeArea(
          child: const Text("Stuff"),
        ),
      );
}
