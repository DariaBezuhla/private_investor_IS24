import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/home/search_data.dart';
import 'package:privateinvestorsmobile/network/search_service.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../expose.dart';
import '../../results/card/real_estate_card.dart';
import '../../results/card/real_estate_object.dart';

class ListViewForResults extends StatefulWidget {
  final String theme; // for 'Dark' or 'Light' Theme

  const ListViewForResults({
    Key key,
    this.theme,
  }) : super(key: key);

  ListViewForResultsState createState() => ListViewForResultsState();
}

class ListViewForResultsState extends State<ListViewForResults>
    with TickerProviderStateMixin {
  String howSorting = "desc";
  String sortingBy = "firstActivationDate";

  List<RealEstateObject> _estates = List<RealEstateObject>();
  SearchService _searchService = SearchService();
  ScrollController _scrollController;
  int _pageNumber = 0;
  bool _loading = false;

  //For Animation (PageTransition)
  AnimationController _animationController;
  bool returnFromDetailPage = false;
  ValueNotifier<bool> stateNotifier;

  _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _fetchMoreEstates();
    }
  }

  @override
  void initState() {
    _initAnimationController();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _searchService
        .fetchList(pageNumber: _pageNumber, sortBy: sortingBy, sort: howSorting, priceTo: SearchData.budgetTo)
        .then((onValue) {
      setState(() {
        _estates.addAll(onValue);
      });
    });


    // to do: super.initState();

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
          comeFromPage: 0, //0->from ResultsList, 1->from WishList
          housesList: _estates,
          selectedIndex: _estates.indexOf(house),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        controller: _scrollController,
        children: <Widget>[
          (_estates.length > 0) ? Column(
            children: <Widget>[
              for (var estate in _estates) Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setWidth(10),
                      left: ScreenUtil().setWidth(10),
                      right: ScreenUtil().setWidth(10),
                    ),
                  ),
                  RealEstateCard(
                    house: estate,
                    theme: widget.theme,
                    onSelected: onSelected,
                  ),
                ],
              ),

              (_loading == true) ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                ],
              ) : Container(width: 0, height: 0,)
            ],
          ) : Center(
            child: CircularProgressIndicator(),
          )
        ],
    );
  }

  void listSorted() {
//    setState(() {
//      _pageNumber = 0;
//      _estates.clear();
//      _loading = true;
//      _scrollController.dispose();
//    });
//
//    Future.delayed(const Duration(microseconds: 1000), () {
//      _searchService
//        .fetchList(
//            pageNumber: _pageNumber, sortBy: sortingBy, sort: howSorting, priceTo: SearchData.budgetTo)
//        .then((onValue) {
//          setState(() {
//            _loading = false;
//            _estates.addAll(onValue);
//          });
//        }).catchError((onError) {
//          setState(() {
//            _loading = false;
//          });
//        });
//    });
    setState(() {
      _loading = true;
      _pageNumber = 0;
      _estates.clear();
    });

    _searchService
        .fetchList(pageNumber: _pageNumber, sortBy: sortingBy, sort: howSorting, priceTo: SearchData.budgetTo)
        .then((onValue) {
      setState(() {
        _loading = false;
        _estates.addAll(onValue);
        // print("ACHTUNG! BUDGET: " + SearchData.budgetTo.toString());
      });
    }).catchError((onError) {
      print(onError);
      _loading = false;
    });
  }

  void _fetchMoreEstates() {
    setState(() {
      _loading = true;
    });
    _searchService
      .fetchList(pageNumber: _pageNumber + 1, sortBy: sortingBy, sort: howSorting, priceTo: SearchData.budgetTo)
      .then((onValue) {
        setState(() {
          _loading = false;
          _pageNumber++;
          _estates.addAll(onValue);
          // print("ACHTUNG! BUDGET: " + SearchData.budgetTo.toString());
        });
      }).catchError((onError) {
        print(onError);
        _loading = false;
    });
  }
}
