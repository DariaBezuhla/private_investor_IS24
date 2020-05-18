import 'package:flutter/material.dart';
import 'results/appBar/sliver_app_bar_small.dart';
import 'transition/slederDirection.dart';
import 'expose/expose_content.dart';
import 'icons/system_icons_i_s_icons.dart';
import 'results/card/real_estate_object.dart';
import './constant.dart';
import './kostenrechner.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
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
    var iconArrowLeft = IconButton(
        icon: Icon(
          SystemIconsIS.is24_system_48px_chevron_left,
          size: 24,
          color: kCharcoal,
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
        });

    return Scaffold(
      appBar: AppBar(
        leading: iconArrowLeft,
        title: logo,
        backgroundColor: Colors.white,
      ),
      backgroundColor: kBackgroundLight,
      body: ExposeContent(
        house: widget.housesList[currentIndex],
      ),
    );
  }
}
