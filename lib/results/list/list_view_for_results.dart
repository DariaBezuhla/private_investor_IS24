import 'package:flutter/material.dart';
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
  ScrollController _scrollController = ScrollController();
  int _pageNumber = 1;

  //For Animation (PageTransition)
  AnimationController _animationController;
  bool returnFromDetailPage = false;
  ValueNotifier<bool> stateNotifier;

  @override
  void initState() {
    super.initState();
    _initAnimationController();

    _searchService.fetchList(pageNumber: _pageNumber, sortBy: sortingBy, sort: howSorting).then((onValue) {
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
        _fetchMoreEstates(); //_fetchMoreEstates
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
          comeFromPage: 0, //0->from ResultsList, 1->from WishList
          housesList: _estates,
          selectedIndex: _estates.indexOf(house),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _estates.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                EdgeInsets.only(
                    top: ScreenUtil().setWidth(10),
                    left: ScreenUtil().setWidth(10),
                    right: ScreenUtil().setWidth(10),),
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

  void listSorted() {
    _pageNumber = 1;
    _estates.clear();
      _searchService.fetchList(pageNumber: _pageNumber, sortBy: sortingBy, sort: howSorting).then((onValue) {
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
          _fetchMoreEstates(); //_fetchMoreEstates
        }
      });
 //  print("listSorted: " + sortingBy +" : " + howSorting);
  }

  _fetchMoreEstates() {
      _searchService.fetchList(pageNumber: _pageNumber,sortBy: sortingBy, sort: howSorting).then((onValue) {
      _estates.addAll(onValue);
    });
    setState(() {});
  }
}
