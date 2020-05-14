import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import '../../expose.dart';
import '../../results/card/real_estate_card.dart';
import '../../results/card/real_estate_object.dart';

import '../../constant.dart';

class ListWithCardsSliver extends StatefulWidget {
  final List<RealEstateObject> resultsList;
  final String theme; // for 'Dark' or 'Light' Theme

  const ListWithCardsSliver({
    Key key,
    this.resultsList,
    this.theme,
  }) : super(key: key);

  _ListWithCardsSliverState createState() => _ListWithCardsSliverState();
}


class _ListWithCardsSliverState extends State<ListWithCardsSliver>
    with TickerProviderStateMixin {

  AnimationController _animationController;
  bool returnFromDetailPage = false;
  ValueNotifier<bool> stateNotifier;
  final String arrowLeftIcon =
      'assets/icons/is24_system/is24_system_48px_arrow_left.svg';
  final String sortIcon = 'assets/icons/Aditional_icons_48px_SVG/additional_icons_48px_sort.svg';

  @override
  void initState() {
    super.initState();
    _initAnimationController();
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
              housesList: widget.resultsList,
              selectedIndex: widget.resultsList.indexOf(house),
            );
          }),
    );
  }
  @override
  Widget build(BuildContext context) {
    //colors for 'Dark' or 'Light' Theme
    var backgroundColor =
        (this.widget.theme == 'Dark') ? dBackgroundColor : kBackgroundLight;

    return SliverList(
      delegate: SliverChildListDelegate(
        widget.resultsList == null
            ? <Widget>[]
            : widget.resultsList.map((house) {
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
