import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/network/search_service.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_card.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import 'package:privateinvestorsmobile/wishlist/favorites.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../expose.dart';
import 'no_saveed_items.dart';

class Wishlist extends StatefulWidget {
  final String theme;

  const Wishlist({
    Key key,
    this.theme = 'Light',
  }) : super(key: key);

  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> with TickerProviderStateMixin {
  //For ListView
  List<RealEstateObject> _favorites = List<RealEstateObject>();
  SearchService _searchService = SearchService();

  //For Animation (PageTransition)
  AnimationController _animationController;
  bool returnFromDetailPage = false;
  ValueNotifier<bool> stateNotifier;


  @override
  void initState() {
    super.initState();
    _initAnimationController();

    //Load list from shared_preference
    List<String> loaded = Favorites.getList();

    for (String id in loaded) {
      _searchService.fetchFavorite(id: id).then((value) {
        setState(() {
          _favorites.add(value);

        });
      });
    }
    super.initState();
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
    super.dispose();
  }

  void onSelected(RealEstateObject house) async {
    _animationController.forward(from: 0.0);
    stateNotifier.value = await Navigator.of(context).push(
      PageRouteGenerator(
        //fullscreenDialog: true,
          builder: (context) {
            return ExposeScreen(
              comeFromPage: 1,
              housesList: _favorites,
              selectedIndex: _favorites.indexOf(house),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        _favorites.isEmpty
            ? <Widget>[NoSavedItems()]
            : _favorites.map((house) {
          return RealEstateCard(
            house: house,
            theme: widget.theme,
            onSelected: onSelected,
          );
        }).toList(),
      ),
    );
  }
}