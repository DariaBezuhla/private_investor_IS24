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
  final int budget;
  final String estateType;
  final String geoCode;
  final int netYield;
  final int rentTrend;
  final int priceTrend;
  final int factor;
  final int pricePerSqm;
  final double rooms;
  final int livingSpace;
  final bool refurbished;
  final bool rented;
  final bool plausible;

  const ResultScreen({
    Key key,
    this.theme,
    this.budget,
    this.estateType,
    this.geoCode,
    this.netYield,
    this.rentTrend,
    this.priceTrend,
    this.factor,
    this.pricePerSqm,
    this.rooms,
    this.livingSpace,
    this.refurbished,
    this.rented,
    this.plausible,
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
    _fetchLengthForAppBar();
  }

  _fetchLengthForAppBar() {
    _searchService
        .fetchLength(
      priceTo: widget.budget,
      estateType: widget.estateType,
      geocode: widget.geoCode,
      netYieldFrom: widget.netYield,
      priceTrendFrom: widget.priceTrend,
      rentTrendFrom: widget.rentTrend,
      factorTo: widget.factor,
      pricePerSqm: widget.pricePerSqm,
      roomsFrom: widget.rooms,
      livingSpaceFrom: widget.livingSpace,
      isRented: widget.rented,
      isNotFlagged: widget.plausible,
      refurbished: widget.refurbished,
    )
        .then((value) {
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
              budget: widget.budget,
              estateType: widget.estateType,
              geocode: widget.geoCode,
              netYield: widget.netYield,
              priceTrend: widget.priceTrend,
              rentTrend: widget.rentTrend,
              factorTo: widget.factor,
              pricePerSqm: widget.pricePerSqm,
              rooms: widget.rooms,
              livingSpace: widget.livingSpace,
              refurbished: widget.refurbished,
              rented: widget.rented,
              plausible: widget.plausible,
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
