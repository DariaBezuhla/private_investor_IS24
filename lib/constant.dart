import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// API Keys
const String GOOGLE_MAPS_API = 'AIzaSyAeJKK0mroXTxP6OvFwxplvf88Q-ZqyfBc';

// Colors
const kTeal = Color(0xFF00FFD0);
const kCharcoal = Color(0xFF333333);
const kGrey = Color(0xFFCDCDCD);
const kDivider = Color(0xFFD6D6D6);
const kLightGrey = Color(0xFFADADAD);
const kLightGrey2 = Color(0x0FF858585);
const kLight = Color(0x0FF7F7F7F);
const kShadow = Colors.grey;
const kError = Color(0xffE84853);
const kCard = Colors.white;
const kBackground = Color(0xffe5e5e5);
const kBackgroundLight = Color(0xfffafafa);
const kHeaderFooter = Colors.white; //
const kFooter = Color(0xfff0f0f0);
const kIcon = kCharcoal;

//dark colors
const dCardsColor = Color(0xff3e3e3e);
const dIconColor = Color(0xffE5E5E5);
const dTextColorLight = Color(0xffE5E5E5);
const dTextColorDark = Color(0xffadadad);
const dBackgroundColor = Color(0xff333333);
const dHeaderFooter = Color(0xff373737);
const greyContainerContent = Color(0x0FF5c5c5c);
const dSliderColor = Color(0xff5c5c5c);

//Sizes
const bottomHeight = 56.0;
const appBarHeight = 56.0;

//Theme
ThemeData light = ThemeData(
  appBarTheme: AppBarTheme(
    color: kHeaderFooter,
  ),
  dialogBackgroundColor: Colors.white,
  bottomAppBarColor: kHeaderFooter,
  primaryColor: kTeal,
  fontFamily: 'MakeItSans',
  cardColor: kCard,
  scaffoldBackgroundColor:
      kHeaderFooter, //Important for SafeArea for AppBar -> scaffoldBackgroundColor = kHeaderFooter
  backgroundColor: kBackgroundLight,
  primaryIconTheme: IconThemeData(size: 24, color: kCharcoal),
  iconTheme: IconThemeData(size: 16, color: kCharcoal), //big icons dark
  accentIconTheme: IconThemeData(size: 32, color: kCharcoal), //normal icons
  dividerColor: kLightGrey,
  buttonColor: kTeal,
  textTheme: TextTheme(
      headline1: header1,
      headline2: header2,
      headline3: header3,
      headline4: header4,
      bodyText2: styleText, // default light style für Text()
      subtitle1: styleBigText,
      subtitle2: styleDescriptionText),
);

ThemeData dark = ThemeData(
  appBarTheme: AppBarTheme(
    color: dHeaderFooter,
  ),
  dialogBackgroundColor: kCharcoal,
  bottomAppBarTheme: BottomAppBarTheme(color: dHeaderFooter),
  bottomAppBarColor: dHeaderFooter,
  primaryColor: kTeal,
  fontFamily: 'MakeItSans',
  cardColor: dCardsColor,
  scaffoldBackgroundColor:
      dHeaderFooter, //Important for SafeArea for AppBar -> scaffoldBackgroundColor = dHeaderFooter
  backgroundColor: dBackgroundColor,
  primaryIconTheme: IconThemeData(size: 24, color: dIconColor),
  iconTheme: IconThemeData(size: 16, color: dIconColor),
  accentIconTheme: IconThemeData(size: 32, color: dIconColor),
  dividerColor: dCardsColor,
  buttonColor: kTeal,
  textTheme: TextTheme(
      headline1: dHeader1,
      headline2: dHeader2,
      headline3: dHeader3,
      headline4: dHeader4,
      bodyText2: dStyleText, // default dark style für Text()
      subtitle1: dStyleBigText,
      subtitle2: dStyleDescriptionText),
);

const themeKey = "isDarkMode";
const locationKey = "trackUserLocation";
const equityKey = "userEquity";

//Light Text Style
//const header2 = TextStyle(fontSize: 20, color: kCharcoal);
const helpers = TextStyle(fontSize: 15, color: kGrey);

//Shadow for Material
const dElevation = 0.0;
const elevation = 2.0;
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
const headerCharcoal = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: kCharcoal,
  fontSize: 24.0,
);
const header4 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: kCharcoal,
  fontSize: 18.0,
);
const header5 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: kCharcoal,
  fontSize: 13.0,
);
const styleBigText = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: kLightGrey2,
  fontSize: 20.0,
);
const styleText = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: kCharcoal,
  fontSize: 16.0,
);
const styleTextHighlight = TextStyle(
  backgroundColor: kTeal,
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  fontSize: 16.0,
  color: kCharcoal,
);
const inputLabel = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: kLightGrey,
  fontSize: 16.0,
);
const inputPlaceholder = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  color: kLightGrey,
  fontSize: 12.0,
);

const styleButton = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: kCharcoal,
  fontSize: 16.0,
);

const disabledButton = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: kLightGrey2,
  fontSize: 16.0,
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
const dHeader5 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  color: kCharcoal,
  fontSize: 22,
);
const dHeader6 = TextStyle(
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
  color: kCharcoal,
  letterSpacing: 0.6,
);
const dHeader7 = TextStyle(
  backgroundColor: kTeal,
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
  color: kCharcoal,
  letterSpacing: 0.2,
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

const styleContainerDescription = TextStyle(
  backgroundColor: Colors.transparent,
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
  height: 0.5,
  color: Colors.black,
);

const styleContainerDescription2 = TextStyle(
  backgroundColor: Colors.transparent,
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  fontSize: 17.0,
  height: 1.0,
  color: greyContainerContent,
);

const styleContainerContent = TextStyle(
  backgroundColor: Colors.transparent,
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
  height: 1.0,
  color: Colors.black,
);

const textFieldHeader = TextStyle(
  backgroundColor: Colors.transparent,
  fontFamily: 'MakeItSans',
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
  height: 0.7,
  color: kLightGrey2,
);

const textFieldContent = TextStyle(color: kLightGrey, fontSize: 12.0);

//Logo
var dLogo = Image.asset(
  'assets/logo/inverse.png',
  height: 24,
);
var logo = Image.asset(
  'assets/logo/logo.png',
  height: 24,
);

//RatingButton colors
const kTOP = Color(0xff538974);
const kGOOD = Color(0xff69C18E);
const kFAIR = Color(0xff9AEABC);
const kPOOR = Color(0xffF5D994);
const kBAD = Color(0xffF59898);
const kNONE = Color(0xffDCDCDC);

class CustomStyle {
  //Light Text Styles
  static TextStyle header1(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: kCharcoal,
      fontSize: ScreenUtil().setSp(34),
    );
  }

  static TextStyle header2(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: kCharcoal,
      fontSize: ScreenUtil().setSp(28),
    );
  }

  static TextStyle header3(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: ScreenUtil().setSp(24),
    );
  }

  static TextStyle headerDarkGrey(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: kCharcoal,
      fontSize: ScreenUtil().setSp(24),
    );
  }

  static TextStyle header4(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: kCharcoal,
      fontSize: ScreenUtil().setSp(18),
    );
  }

  static TextStyle header5(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: kCharcoal,
      fontSize: ScreenUtil().setSp(13),
    );
  }

  static TextStyle styleBigText(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      color: kLightGrey2,
      fontSize: ScreenUtil().setSp(20),
    );
  }

  static TextStyle styleText(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      color: kCharcoal,
      fontSize: ScreenUtil().setSp(16),
    );
  }

  static TextStyle descriptionText(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      color: kLight,
      fontSize: ScreenUtil().setSp(10),
    );
  }

  static TextStyle styleTextForTablets(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: kCharcoal,
      fontSize: ScreenUtil().setSp(10),
    );
  }

  static TextStyle rankingText(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: ScreenUtil().setSp(10),
    );
  }

  static TextStyle styleTextHighlight(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      backgroundColor: kTeal,
      color: kCharcoal,
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      fontSize: ScreenUtil().setSp(16),
    );
  }

  static TextStyle inputLabel(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      color: kLightGrey,
      fontSize: ScreenUtil().setSp(16),
    );
  }

  static TextStyle inputPlaceholder(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      color: kLightGrey,
      fontSize: ScreenUtil().setSp(12),
    );
  }

  static TextStyle styleButton(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: kCharcoal,
      fontSize: ScreenUtil().setSp(16),
    );
  }

  static TextStyle disabledButton(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: kLightGrey2,
      fontSize: ScreenUtil().setSp(16),
    );
  }

  static TextStyle textFieldHeader(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      backgroundColor: Colors.transparent,
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      fontSize: ScreenUtil().setSp(14),
      color: kLightGrey2,
    );
  }

  static TextStyle textFieldInsideHeader(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      backgroundColor: Colors.transparent,
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      fontSize: ScreenUtil().setSp(12),
      color: kLightGrey2,
    );
  }

  //Dark Text Styles

  static TextStyle dHeader1(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: dTextColorLight,
      fontSize: ScreenUtil().setSp(34),
    );
  }

  static TextStyle dHeader2(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: dTextColorLight,
      fontSize: ScreenUtil().setSp(28),
    );
  }

  static TextStyle dHeader3(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: ScreenUtil().setSp(24),
    );
  }

  //dont use in Theme
  static TextStyle dheaderLightGrey(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: dTextColorLight,
      fontSize: ScreenUtil().setSp(24),
    );
  }

  static TextStyle dHeader4(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: dTextColorLight,
      fontSize: ScreenUtil().setSp(18),
    );
  }

  static TextStyle dStyleBigText(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      color: dTextColorLight,
      fontSize: ScreenUtil().setSp(20),
    );
  }

  static TextStyle dStyleText(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      color: dTextColorLight,
      fontSize: ScreenUtil().setSp(16),
    );
  }

  static TextStyle dDescriptionText(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      color: dTextColorDark,
      fontSize: ScreenUtil().setSp(10),
    );
  }

  static TextStyle dRankingText(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: ScreenUtil().setSp(10),
    );
  }

  static TextStyle dStyleTextHighlight(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      backgroundColor: kTeal,
      color: dTextColorLight,
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      fontSize: ScreenUtil().setSp(16),
    );
  }

  static TextStyle dInputLabel(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      color: dTextColorLight,
      fontSize: ScreenUtil().setSp(16),
    );
  }

  static TextStyle dInputPlaceholder(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      color: dTextColorLight,
      fontSize: ScreenUtil().setSp(12),
    );
  }

  static TextStyle dStyleButton(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: dTextColorLight,
      fontSize: ScreenUtil().setSp(16),
    );
  }

  static TextStyle dDisabledButton(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.bold,
      color: dTextColorLight,
      fontSize: ScreenUtil().setSp(16),
    );
  }

  static TextStyle dTextFieldHeader(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      backgroundColor: Colors.transparent,
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      fontSize: ScreenUtil().setSp(14),
      color: dTextColorLight,
    );
  }

  static TextStyle dTextFieldInsideHeader(BuildContext context) {
    // return Theme.of(context).textTheme.headline1.copyWith(fontSize: 192.0);
    return TextStyle(
      backgroundColor: Colors.transparent,
      fontFamily: 'MakeItSans',
      fontWeight: FontWeight.normal,
      fontSize: ScreenUtil().setSp(12),
      color: dTextColorLight,
    );
  }

  static ThemeData light(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: kHeaderFooter,
      ),
      dialogBackgroundColor: Colors.white,
      bottomAppBarColor: kHeaderFooter,
      primaryColor: kTeal,
      fontFamily: 'MakeItSans',
      cardColor: kCard,
      scaffoldBackgroundColor:
          kHeaderFooter, //Important for SafeArea for AppBar -> scaffoldBackgroundColor = kHeaderFooter
      backgroundColor: kBackgroundLight,
      primaryIconTheme: IconThemeData(size: 24, color: kCharcoal),
      iconTheme: IconThemeData(size: 16, color: kCharcoal), //big icons dark
      accentIconTheme: IconThemeData(size: 32, color: kCharcoal), //normal icons
      dividerColor: kLightGrey,
      buttonColor: kTeal,
      disabledColor: Colors.grey[400],
      accentColor: Colors.grey[700],
      textTheme: TextTheme(
          headline1: header1(context),
          headline2: header2(context),
          headline3: header3(context),
          headline4: header4(context),
          bodyText2: styleText(context), // default light style für Text()
          subtitle1: styleBigText(context),
          subtitle2: descriptionText(context),
          caption: inputLabel(context),
          button: styleButton(context)),
    );
  }

  static ThemeData dark(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: dHeaderFooter,
      ),
      dialogBackgroundColor: kCharcoal,
      bottomAppBarTheme: BottomAppBarTheme(color: dHeaderFooter),
      bottomAppBarColor: dHeaderFooter,
      primaryColor: kTeal,
      fontFamily: 'MakeItSans',
      cardColor: dCardsColor,
      scaffoldBackgroundColor:
          dHeaderFooter, //Important for SafeArea for AppBar -> scaffoldBackgroundColor = dHeaderFooter
      backgroundColor: dBackgroundColor,
      primaryIconTheme: IconThemeData(size: 24, color: dIconColor),
      iconTheme: IconThemeData(size: 16, color: dIconColor),
      accentIconTheme: IconThemeData(size: 32, color: dIconColor),
      dividerColor: dCardsColor,
      buttonColor: kTeal,
      disabledColor: Colors.grey[700],
      accentColor: Colors.grey[900],
      //buttonTheme: ButtonThemeData(disabledColor: Colors.grey[700]),
      textTheme: TextTheme(
        headline1: dHeader1(context),
        headline2: dHeader2(context),
        headline3: dHeader3(context),
        headline4: dHeader4(context),
        bodyText2: dStyleText(context), // default light style für Text()
        subtitle1: dStyleBigText(context),
        subtitle2: dDescriptionText(context),
        caption: dInputLabel(context),
        button: dStyleButton(context),
      ),
    );
  }
}
