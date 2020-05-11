import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/results/appBar/sliver_app_bar.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';
import 'package:privateinvestorsmobile/results/list/list_with_cards.dart';
import 'package:privateinvestorsmobile/bottomBar/bottom_bar.dart';
import 'constant.dart';

class ResultScreen extends StatefulWidget {
  final String theme;
  final List<RealEstateObject> resultsList;


  const ResultScreen({Key key, this.theme, this.resultsList, }) : super(key: key);
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  bool returnFromDetailPage = false;
  ValueNotifier<bool> stateNotifier;

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

  // for transition later important

/*  void onSelected(RealEstateObject house) async {
    _animationController.forward(from: 0.0);
    stateNotifier.value = await Navigator.of(context).push(
      PageRouteGenerator(
        //fullscreenDialog: true,
          builder: (context) {
            return DetailsScreen(
              housesList: results,
              selectedIndex: results.indexOf(house),
            );
          }),
    );
  }
 */

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

