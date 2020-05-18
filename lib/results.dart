import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/expose.dart';
import 'package:privateinvestorsmobile/results/appBar/sliver_app_bar.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_card.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';
import 'package:privateinvestorsmobile/results/list/list_with_cards.dart';
import 'package:privateinvestorsmobile/bottomBar/bottom_bar.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import 'constant.dart';

class ResultScreen extends StatefulWidget {
  final String theme;
  final List<RealEstateObject> resultsList;


  const ResultScreen({Key key, this.theme, this.resultsList, }) : super(key: key);
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {
    var colorForBackground = (widget.theme == 'Dark') ? dHeaderFooter : kHeaderFooter;
    var listBackground = (widget.theme == 'Dark') ? dBackgroundColor : kBackgroundLight;

    return Scaffold(
      backgroundColor: colorForBackground,
      body: SafeArea(
        child: Container(
          color: listBackground,
          child: CustomScrollView(
            slivers: <Widget>[
              AppBarSliver(
                theme: widget.theme,
                resultsLength: (widget.resultsList == null) ? 0 : widget.resultsList.length,
              ),
              ListWithCardsSliver(
                resultsList: widget.resultsList,
                theme: widget.theme,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: BottomBar(theme: widget.theme,)),
    );
  }
}

