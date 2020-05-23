import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/network/search_service.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import '../../expose.dart';
import '../../results/card/real_estate_card.dart';
import '../../results/card/real_estate_object.dart';

import '../../constant.dart';

class ListViewForResults extends StatefulWidget {
  final String theme; // for 'Dark' or 'Light' Theme

  const ListViewForResults({
    Key key,
    this.theme,
  }) : super(key: key);

  _ListViewForResultsState createState() => _ListViewForResultsState();
}


class _ListViewForResultsState extends State<ListViewForResults>
    with TickerProviderStateMixin {
  //For ListView
  List<RealEstateObject> _estates = List<RealEstateObject>();
  SearchService _searchService = SearchService();
  ScrollController _scrollController = ScrollController();
  int _pageNumber = 1;

  //For Animation (PageTransition)
  AnimationController _animationController;
  bool returnFromDetailPage = false;
  ValueNotifier<bool> stateNotifier;

  //Icons
  final String arrowLeftIcon =
      'assets/icons/is24_system/is24_system_48px_arrow_left.svg';
  final String sortIcon = 'assets/icons/Aditional_icons_48px_SVG/additional_icons_48px_sort.svg';

  @override
  void initState() {
    super.initState();
    _initAnimationController();
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

  void _initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..addListener(() {
      setState(() {});
    });

    stateNotifier = ValueNotifier(returnFromDetailPage)
      ..addListener(() {
        if (stateNotifier.value) {
          _animationController.reverse(from: 1.0);
          stateNotifier.value = false;
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    stateNotifier.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void onSelected(RealEstateObject house) async {
    _animationController.forward(from: 0.0);
    stateNotifier.value = await Navigator.of(context).push(
      PageRouteGenerator(
        //fullscreenDialog: true,
          builder: (context) {
            return ExposeScreen(
              housesList: _estates,
              selectedIndex: _estates.indexOf(house),
            );
          }),
    );
  }
  @override
  Widget build(BuildContext context) {
    //colors for 'Dark' or 'Light' Theme
    var backgroundColor =
    (this.widget.theme == 'Dark') ? dBackgroundColor : kBackgroundLight;

    return  ListView.builder(
      controller: _scrollController,
      //shrinkWrap: true,
      itemCount: _estates.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              ),
              RealEstateCard(
                house: _estates[index],
                theme: widget.theme,
                onSelected: onSelected,
              )
            ],
          ),
        );
      },
    );
  }

  _fetchMoreEstates() {
    _searchService.fetchList(pageNumber: _pageNumber).then((onValue) {
      _estates.addAll(onValue);
    });
    setState(() {});
  }
}