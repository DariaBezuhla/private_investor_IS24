import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:privateinvestorsmobile/transition/slederDirection.dart';
import 'appBar/app_bar_for_expose.dart';
import 'bottomBar/bottom_bar.dart';
import 'expose/expose_content.dart';
import 'results/card/real_estate_object.dart';
import './constant.dart';

class ExposeScreen extends StatefulWidget {
  final List<RealEstateObject> housesList;
  final int selectedIndex;
  final int comeFromPage;

  const ExposeScreen({
    Key key,
    this.housesList,
    this.selectedIndex,
    this.comeFromPage = 0, //for AppBarForExpose()
  }) : super(key: key);

  @override
  @override
  _ExposeScreenState createState() => _ExposeScreenState();
}

class _ExposeScreenState extends State<ExposeScreen>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  int offstageIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  ValueNotifier<SlideDirection> slideNotifier;

  AnimationController _slideLeftAnimation;
  Animation<Offset> heroSlide;
  Animation<Offset> offstageSlide;
  double contentSpacing;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;

    slideNotifier = ValueNotifier(slideDirection)
      ..addListener(() {
        setState(() {
          animate();
        });
      });

    _slideLeftAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          updateContents();
        }
      });
  }

  @override
  void dispose() {
    _slideLeftAnimation.dispose();
    slideNotifier.dispose();
    super.dispose();
  }

  void animate() {
    switch (slideNotifier.value) {
      case SlideDirection.leftToRight:
        heroSlide = Tween<Offset>(
          begin: Offset(0.0, 0.0),
          end: Offset(contentSpacing, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideLeftAnimation,
            curve: Curves.easeInOut,
          ),
        );

        offstageSlide = Tween<Offset>(
          begin: Offset(-contentSpacing, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideLeftAnimation,
            curve: Curves.easeInOut,
          ),
        );

        _slideLeftAnimation.forward(from: 0.0);
        break;
      case SlideDirection.rightToLeft:
        heroSlide = Tween<Offset>(
          begin: Offset(0.0, 0.0),
          end: Offset(-contentSpacing, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideLeftAnimation,
            curve: Curves.easeInOut,
          ),
        );

        offstageSlide = Tween<Offset>(
          begin: Offset(contentSpacing, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideLeftAnimation,
            curve: Curves.easeInOut,
          ),
        );

        _slideLeftAnimation.forward(from: 0.0);
        break;
      default:
        break;
    }
  }

  void updateContents() {
    switch (slideNotifier.value) {
      case SlideDirection.leftToRight:
        currentIndex =
            (currentIndex - 1).clamp(0, widget.housesList.length - 1);
        slideNotifier.value = SlideDirection.none;
        break;
      case SlideDirection.rightToLeft:
        currentIndex =
            (currentIndex + 1).clamp(0, widget.housesList.length - 1);
        slideNotifier.value = SlideDirection.none;
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);

    return Scaffold(
      appBar: AppBarForExpose(fromPage: widget.comeFromPage, houseId: widget.housesList[currentIndex].id),//AppBarWithArrow(),
      body:
      Container(
        color: kBackgroundLight,
        child: ExposeContent(
          house: widget.housesList[currentIndex],
        ),
      ),
      bottomNavigationBar: BottomBar(selectedIndex: 0, theme: light,),
    );
  }

}