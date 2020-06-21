import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../theme.dart';
import 'help_classes/bottom_for_bar.dart';
import 'help_classes/sorting_choices.dart';

//AppBarr for ResultsPage
class AppBarSliverBig extends StatefulWidget {
  final int resultsLength;
  final Function() function;

  const AppBarSliverBig({Key key, this.resultsLength, this.function})
      : super(key: key);

  @override
  AppBarSliverBigState createState() => AppBarSliverBigState();
}

class AppBarSliverBigState extends State<AppBarSliverBig> {
  static String sortingChoice;
  static String ascending =
      "desc"; //  descending (desc) 3-2-1 <--> ascending (asc) 1-2-3-... newesd->oldest

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getDisplayTheme(context);

    var iconSizeForTablets = 45.0;
    var iconSize = MediaQuery.of(context).size.height > 1300.0
        ? iconSizeForTablets
        : ScreenUtil().setWidth(24);
    var logoApp = themeProvider.getTheme() == dark ? dLogo : logo;
    var filterBarHeight =
        ScreenUtil().setHeight(12) + ScreenUtil().setWidth(27);
    final double statusBarHeight = 56;

    var iconArrowLeft = IconButton(
        icon: Icon(
          SystemIconsIS.is24_system_48px_chevron_left,
          size: iconSize,
          color: theme.iconTheme.color,
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
        });

    //Sorting
    var iconSort = IconButton(
      icon: Icon(
        SystemIconsIS.is24_system_48px_rearrange,
        size: iconSize,
        color: theme.iconTheme.color,
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
                style: theme.textTheme.bodyText2,
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
          child: sorting,
        ),
      ],
      pinned: false,
      floating: true,
      expandedHeight: filterBarHeight + statusBarHeight,
      backgroundColor: theme.appBarTheme.color,
      elevation: elevation,
      flexibleSpace: FlexibleSpaceBar(
        background: FiltersForAppBar(
          resultsLength: widget.resultsLength,
        ),
      ),
    );
  }

  String valueForFetchingResults(String userChoice) {
    switch (userChoice) {
      case 'Aktualität':
        {
          return 'firstActivationDate';
        }
        break;
      case 'Preis':
        {
          return 'price';
        }
        break;
      case 'Preis pro m2':
        {
          return 'pricePerSqm';
        }
        break;
      case 'Nettorendite':
        {
          return 'netYield';
        }
      case 'Actuality':
        {
          return 'firstActivationDate';
        }
        break;
      case 'Price':
        {
          return 'price';
        }
        break;
      case 'Price per m2':
        {
          return 'pricePerSqm';
        }
        break;
      case 'Net Yield':
        {
          return 'netYield';
        }
        break;
      default:
        {
          return 'firstActivationDate';
        }
        break;
    }
  }

  void choiceAction(String choice) {
    this.setState(() {
      sortingChoice = valueForFetchingResults(choice);
      ascending = ascending == 'desc' ? 'asc' : 'desc';
      //print(sortingChoice + ' inAPP');
      widget.function(); //function() is in Parent Widget -> ResultsScreen
    });
  }
}
