import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/expose.dart';
import 'package:privateinvestorsmobile/results/appBar/sliver_app_bar.dart';
import 'package:privateinvestorsmobile/results/appBar/sliver_app_bar_small.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_card.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';
import 'package:privateinvestorsmobile/results/list/list_view_for_results.dart';
import 'package:privateinvestorsmobile/results/list/list_with_cards.dart';
import 'package:privateinvestorsmobile/bottomBar/bottom_bar.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import 'constant.dart';
import 'network/search_service.dart';

class ResultScreen extends StatefulWidget {
  final String theme;
  final List<RealEstateObject> resultsList;

  const ResultScreen({
    Key key,
    this.theme,
    this.resultsList,
  }) : super(key: key);
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<RealEstateObject> _estates = List<RealEstateObject>();
  SearchService _searchService = SearchService();
  ScrollController _scrollController = ScrollController();

  int _pageNumber = 1;

  @override
  void initState() {
    super.initState();
    _searchService.fetchList(pageNumber: _pageNumber).then((onValue) {
      setState(() {
        _estates.addAll(onValue);
      });
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          (0.975 * _scrollController.position.maxScrollExtent)) {
        setState(() {
          _pageNumber++;
        });
        _fetchMoreEstates();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

// Infinite scroll
  @override
  Widget build(BuildContext context) {
    var colorForBackground =
    (widget.theme == 'Dark') ? dHeaderFooter : kHeaderFooter;
    var listBackground =
    (widget.theme == 'Dark') ? dBackgroundColor : kBackgroundLight;
    var resultLenght =
    (widget.resultsList == null) ? 0 : widget.resultsList.length;

    return Scaffold(
      backgroundColor: colorForBackground,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              AppBarSliver(
                theme: widget.theme,
                resultsLength:
                (_estates.length == null) ? 0 : _estates.length,
              ),
            ];
          },
          body: ListViewForResults(),
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: BottomBar(
            theme: widget.theme,
              selectedIndex: 0
          )),
    );
  }

// fetches all estates minh cong
  _fetchMoreEstates() {
    _searchService.fetchList(pageNumber: _pageNumber).then((onValue) {
      _estates.addAll(onValue);
    });
    setState(() {});
  }
}

/*
return Scaffold(
      body: SafeArea(
        child: Container(
          color: listBackground,
          child: CustomScrollView(
            slivers: <Widget>[
              /*AppBarSliver(
                theme: widget.theme,
                resultsLength: (widget.resultsList == null) ? 0 : widget.resultsList.length,
              ),*/
              SliverList(
                  delegate: SliverChildListDelegate([
                    ListView.builder(
                      controller: _scrollController,
                      //shrinkWrap: true,
                      itemCount: _estates.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.0,
                                  left: 10.0,
                                  right: 10.0
                                ),
                              ),
                              RealEstateCard(
                                house: _estates[index],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ])),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: BottomBar(
        theme: widget.theme,
      )),
    );
 */

