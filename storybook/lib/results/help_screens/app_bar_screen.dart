
import 'package:storybook/results/SliverAppBar/sliver_app_bar.dart';
import 'package:storybook/results/card/real_estate_object.dart';
import 'package:storybook/results/card/real_estate_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppBarScreen extends StatefulWidget {
  final List<RealEstateObject> resultsList;

  const SliverAppBarScreen({Key key, this.resultsList}) : super(key: key);

  @override
  _SliverAppBarScreenState createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen> {
  bool _filterOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            AppBarSliver(),
            SliverList(
              delegate: SliverChildListDelegate(
                widget.resultsList == null
                    ? <Widget>[]
                    : widget.resultsList.map((house) {
                  return RealEstateCard(house: house);
                }).toList(),
              ),
            ),
          ],
        ));
  }
}