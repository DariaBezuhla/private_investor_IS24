import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/appBar/app_bar_sliver_big.dart';
import 'package:privateinvestorsmobile/bottomBar/bottom_bar.dart';
import 'package:privateinvestorsmobile/results/list/lengthOfResult.dart';
import 'package:privateinvestorsmobile/results/list/list_view_for_results.dart';

import 'constant.dart';
import 'network/search_service.dart';

class ResultScreen extends StatefulWidget {
  final String theme;

  const ResultScreen({
    Key key,
    this.theme,
  }) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final GlobalKey<AppBarSliverBigState> _key = GlobalKey();
  final GlobalKey<ListViewForResultsState> _key2 = GlobalKey();
  String sortingBy;
  String howSorting;

  ResultsLength _lengthOfResults = ResultsLength();
  var _lenght = 0;
  SearchService _searchService = SearchService();

  //For sorting:
  //  refreshChoice() is called in AppBarSliverBig;
  //  what does: _ResultScreenState.setState() with new sortingBy property
  void refreshChoice() {
    setState(() {
      sortingBy = AppBarSliverBigState.sortingChoice;
      howSorting = AppBarSliverBigState.ascending;
      refreshList();
    });
  }

  //  refreshList(String sort) is called in refreshChoice();
  //  what does: ListViewForResults.listSorted(sort) -> update list of results
  void refreshList() {
    _key2.currentState.sortingBy = this
        .sortingBy; //sortingBy in ListViewForResults = this.sortingBy in ResultScreen
    _key2.currentState.howSorting = this.howSorting;
    _key2.currentState.listSorted(); //try without
  }

  @override
  void initState() {
    super.initState();

    _searchService.fetchLength().then((value) {
      setState(() {
        _lengthOfResults = value;
        _lenght = _lengthOfResults.numberOfListings.toInt();
      });
    });
  }

// Infinite scroll
  @override
  Widget build(BuildContext context) {
    var colorBackground =
        (widget.theme == 'Dark') ? dBackgroundColor : kBackgroundLight;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: colorBackground,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                AppBarSliverBig(
                  key: _key,
                  function: refreshChoice,
                  resultsLength:
                      _lenght, //to do: we don't have resultsLength !!!
                ),
              ];
            },
            body: ListViewForResults(
              key: _key2,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 0,
      ),
    );
  }
}
