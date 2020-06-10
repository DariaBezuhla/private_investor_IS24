import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/appBar/app_bar_sliver_big.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';
import 'package:privateinvestorsmobile/results/list/list_view_for_results.dart';
import 'package:privateinvestorsmobile/bottomBar/bottom_bar.dart';
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
  String sortingBy = 'firstActivationDate';

  //For sorting:
  //  refreshChoice() is called in AppBarSliverBig;
  //  what does: _ResultScreenState.setState() with new sortingBy property
  void refreshChoice() {
    setState(() {
      sortingBy = AppBarSliverBigState.sortingChoice;
      refreshList(sortingBy);
    });
  }

  //  refreshList(String sort) is called in refreshChoice();
  //  what does: ListViewForResults.listSorted(sort) -> update list of results
  void refreshList(String sort) {
    _key2.currentState.sortBy = sortingBy; //sortBy in ListViewForResults = sortingBy in ResultScreen
    _key2.currentState.listSorted(sort);
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
                  theme: widget.theme,
                  resultsLength: 0, //to do: we don't have resultsLength !!!
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
        theme: widget.theme,
      ),
    );
  }
}
