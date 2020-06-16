import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import '../constant.dart';
import 'help_classes/bottom_for_bar.dart';
import 'help_classes/sorting_choices.dart';

//AppBarr for ResultsPage
class AppBarSliverBig extends StatefulWidget {
  final String theme;
  final int resultsLength;
  final Function() function;

  const AppBarSliverBig(
      {Key key, this.theme, this.resultsLength, this.function})
      : super(key: key);

  @override
  AppBarSliverBigState createState() => AppBarSliverBigState();
}


class AppBarSliverBigState extends State<AppBarSliverBig> {
  static String sortingChoice;

  @override
  Widget build(BuildContext context) {
    var iconSizeForTablets = 45.0;
    var iconSize = MediaQuery.of(context).size.height > 1300.0 ? iconSizeForTablets : ScreenUtil().setWidth (24);
    var backgroundColor = (widget.theme == 'Dark') ? dHeaderFooter : kCard;
    var iconColor = (widget.theme == 'Dark') ? dIconColor : kCharcoal;
    var logoApp = (widget.theme == 'Dark') ? dLogo : logo;
    var filterBarHeight = 80;
    final double statusBarHeight = 56;

    var iconArrowLeft = IconButton(
        icon: Icon(
          SystemIconsIS.is24_system_48px_chevron_left,
          size: iconSize,
          color: kIcon,
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
        });

    //Sorting
    var iconSort = IconButton(
      icon: Icon(
        SystemIconsIS.is24_system_48px_rearrange,
        size: iconSize,
        color: iconColor,
      ),
      onPressed: null,
    );



    var sorting = PopupMenuButton<String>(
        icon: iconSort,
        onSelected: choiceAction,
        itemBuilder: (BuildContext context) {
          return SetingsChoices.choices.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(
                choice,
                style: CustomStyle.styleText(context),
              ),
            );
          }).toList();
        });

    return SliverAppBar(
      leading: iconArrowLeft,
      title: Center(child: logoApp),
      actions: <Widget>[
        Container(
            width: 56,
            child: sorting),
      ],
      pinned: false,
      floating: true,
      expandedHeight: filterBarHeight + statusBarHeight,
      backgroundColor: backgroundColor,
      elevation: elevation,
      flexibleSpace: FlexibleSpaceBar(
        background: FiltersForAppBar(
          resultsLength: widget.resultsLength,
          theme: widget.theme,
        ),
      ),
    );
  }



  String valueForFetchingResults (String userChoice) {
    switch (userChoice) {
      case 'Actuality': {
        return 'firstActivationDate';
      }
      break;
      case 'Price': {
        return 'price';
      }
      break;
      case 'Price per m²': {
        return 'pricePerSqm';
      }
      break;
      case 'Net yield': {
        return 'netYield';
      }
      break;
      default: {
        return 'firstActivationDate';
      }
      break;

    }
  }

  void choiceAction(String choice) {
    this.setState(() {
      sortingChoice = valueForFetchingResults(choice);
      //print(sortingChoice + ' inAPP');
      widget.function(); //function() is in Parent Widget -> ResultsScreen

    });
  }
}