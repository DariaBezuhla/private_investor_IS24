import 'package:flutter/material.dart';

// Colors
const kTeal = Color(0xFF00FFD0);
const kCharcoal = Color(0xFF333333);
const kGrey = Color(0xFFCDCDCD);
const kLightGrey = Color(0xFFADADAD);
const kShadow = Colors.grey;
const kError = Color(0xffE84853);
const kCard = Colors.white;
const kBackground = Color(0xffe5e5e5);
const kBackgroundLight = Color(0xfffafafa);
const kHeaderFooter = Colors.white;
const kFooter = Color(0xfff0f0f0);

//dark colors
const dCardsColor = Color(0xff3e3e3e);
const dIconColor = Color(0xffE5E5E5);
const dTextColorLight = Color(0xffE5E5E5);
const dTextColorDark = Color(0xffadadad);
const dBackgroundColor = Color(0xff333333);
const dHeaderFooter = Color(0xff373737);
const dSliderColor = Color(0xff5c5c5c);

//Sizes
const bottomHeight = 56.0;
const appBarHeight = 56.0;

//Theme
ThemeData light = ThemeData(
  fontFamily: 'MakeItSans',
  scaffoldBackgroundColor: Colors.white,
  primaryIconTheme: IconThemeData(size: 32, color: kCharcoal), //big icons dark
  iconTheme: IconThemeData(size: 16, color: kCharcoal), //normal icons
  dividerColor: kLightGrey,
  buttonColor: kTeal,
  textTheme: TextTheme(
    headline3: header3,
    headline4: header4,
    bodyText2: styleText, // default light style für Text()
  ),
);

ThemeData dark = ThemeData(
  fontFamily: 'MakeItSans',
  scaffoldBackgroundColor: dBackgroundColor,
  primaryIconTheme: IconThemeData(size: 32, color: dIconColor),
  iconTheme: IconThemeData(size: 16, color: dIconColor),
  dividerColor: dCardsColor,
  buttonColor: kTeal,
  textTheme: TextTheme(
    headline3: dHeader3,
    headline4: dHeader4,
    bodyText2: dStyleText, // default dark style für Text()
  ),
);

//Light Text Style
//const header2 = TextStyle(fontSize: 20, color: kCharcoal);
const helpers = TextStyle(fontSize: 15, color: kGrey);

//Shadow for Material
const dElevation = 0.0;
const elevation = 3.0;
//Box shadows
const shadowMd = <BoxShadow>[
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    blurRadius: 3.0,
    spreadRadius: -0.5,
    offset: Offset(
      0.0,
      0.5,
    ),
  ),
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.06),
    blurRadius: 2.0,
    spreadRadius: -0.5,
    offset: Offset(
      0.0,
      0.25,
    ),
  )
];

const test = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: kError,
  fontSize: 34.0,
);

const header1 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: kCharcoal,
  fontSize: 34.0,
);
const header2 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: kCharcoal,
  fontSize: 28.0,
);
const header3 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 24.0,
);
const header4 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: kCharcoal,
  fontSize: 18.0,
);
const styleBigText = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: kCharcoal,
  fontSize: 20.0,
);
const styleText = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: kCharcoal,
  fontSize: 16.0,
);
const styleText2 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: kCharcoal,
  fontSize: 16.0,
);
const styleButton = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: kCharcoal,
  fontSize: 16.0,
);
const styleLabel = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: kCharcoal,
  fontSize: 12.0,
);
const stylePrice = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: Colors.black,
  fontSize: 15.0,
);
const styleDescriptionText = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: kCharcoal,
  fontSize: 10.0,
);

//Dark Text Styles

const dHeader1 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: dTextColorLight,
  fontSize: 34.0,
);
const dHeader2 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: dTextColorLight,
  fontSize: 28.0,
);
const dHeader3 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 24.0,
);
const dHeader4 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: dTextColorLight,
  fontSize: 18.0,
);
const dStyleBigText = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: dTextColorLight,
  fontSize: 20.0,
);
const dStyleText = TextStyle(
  fontFamily: 'MakeItSans',
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
  color: dTextColorLight,
);
const dStyleButton = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: dTextColorLight,
  fontSize: 16.0,
);
const dStyleLabel = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: dTextColorLight,
  fontSize: 12.0,
);
const dStyleDescriptionText = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: dTextColorDark,
  fontSize: 10.0,
);
const styleTextField = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: dTextColorDark,
  fontSize: 17.0,
);

//Logo
var dLogo = Image.asset(
  'assets/logo/inverse.png',
  height: 24,
);
var logo = Image.asset(
  'assets/logo/logo.png',
  height: 24,
);
