import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:privateinvestorsmobile/results/card/rating.dart';

import '../../constant.dart';
import 'package:easy_localization/easy_localization.dart';

class RatingButton extends StatelessWidget {
  final String objectRating;

  const RatingButton({Key key, this.objectRating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Rating rating = whatRaiting(objectRating);

    var backgroundColor = colorForButton(rating);
    var firstSmallCardColor = colorForButton(rating);
    var secondSmallCardColor = colorForSecondCard(rating);
    var thirdSmallCardColor = colorForThirdCard(rating);
    var fourthSmallCardColor = colorForFourthCard(rating);
    var fifthSmallCardColor = colorForFifthCard(rating);

    var buttonHeight = ScreenUtil().setHeight(30);
    var width = MediaQuery.of(context).size.width;
    var widthOfX =
        (width - ScreenUtil().setWidth(160)) / 12; //ScreenUtil().setWidth(12);
    var widthOfY = ScreenUtil().setWidth(10);
    var widthOfButton =
        5 * widthOfX + 4 * widthOfY; //ScreenUtil().setWidth(5) * widthOfX +
    //ScreenUtil().setWidth(4) * widthOfY;
    var widthOfSmallCard = (widthOfButton - ScreenUtil().setWidth(8)) /
        5; //ScreenUtil().setWidth(5);
    var hightOfSmallCard = ScreenUtil().setHeight(9);
    var text = textForButton(rating);

    return Container(
      height: buttonHeight,
      width: widthOfButton,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(2)),
            child: Container(
              width: widthOfButton,
              height: ScreenUtil().setHeight(18),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                margin: EdgeInsets.zero,
                color: backgroundColor,
                child: Center(
                  child: Text(
                    text,
                    style: CustomStyle.rankingText(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                  child: SmallCard(
                    rating: rating,
                    color: firstSmallCardColor,
                    width: widthOfSmallCard,
                    height: hightOfSmallCard,
                  )),
              Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                  child: SmallCard(
                    rating: rating,
                    color: secondSmallCardColor,
                    width: widthOfSmallCard,
                    height: hightOfSmallCard,
                  )),
              Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                  child: SmallCard(
                    rating: rating,
                    color: thirdSmallCardColor,
                    width: widthOfSmallCard,
                    height: hightOfSmallCard,
                  )),
              Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                  child: SmallCard(
                    rating: rating,
                    color: fourthSmallCardColor,
                    width: widthOfSmallCard,
                    height: hightOfSmallCard,
                  )),
              SmallCard(
                rating: rating,
                color: fifthSmallCardColor,
                width: widthOfSmallCard,
                height: hightOfSmallCard,
              )
            ],
          ),
        ],
      ),
    );
  }

  colorForButton(Rating rating) {
    switch (rating) {
      case Rating.TOP:
        {
          return kTOP;
        }
        break;
      case Rating.GOOD:
        {
          return kGOOD;
        }
        break;
      case Rating.FAIR:
        {
          return kFAIR;
        }
        break;
      case Rating.POOR:
        {
          return kPOOR;
        }
        break;
      case Rating.BAD:
        {
          return kBAD;
        }
        break;
      case Rating.NONE:
        {
          return kNONE;
        }
        break;
      default:
        {
          return kNONE;
        }
    }
  }

  textForButton(Rating rating) {
    switch (rating) {
      case Rating.TOP:
        {
          return "TOP ANGEBOT".tr().toString();
        }
        break;
      case Rating.GOOD:
        {
          return "GUTES ANGEBOT".tr().toString();
        }
        break;
      case Rating.FAIR:
        {
          return "FAIRES ANGEBOT".tr().toString();
        }
        break;
      case Rating.POOR:
        {
          return "ETWAS TEUER".tr().toString();
        }
        break;
      case Rating.BAD:
        {
          return "TEUER".tr().toString();
        }
        break;
      case Rating.NONE:
        {
          return "KEINE ANGABE".tr().toString();
        }
        break;
      default:
        {
          return "KEINE ANGABE".tr().toString();
        }
    }
  }

  colorForSecondCard(Rating rating) {
    switch (rating) {
      case Rating.TOP:
        {
          return kTOP;
        }
        break;
      case Rating.GOOD:
        {
          return kGOOD;
        }
        break;
      case Rating.FAIR:
        {
          return kFAIR;
        }
        break;
      case Rating.POOR:
        {
          return kPOOR;
        }
        break;
      /*case Rating.BAD:
        {
          return Color(0xffCDCDCD);
        }
        break;
      case Rating.NONE:
        {
          return Color(0xffCDCDCD);
        }
        break;
       */
      default:
        {
          return kNONE;
        }
    }
  }

  colorForThirdCard(Rating rating) {
    switch (rating) {
      case Rating.TOP:
        {
          return kTOP;
        }
        break;
      case Rating.GOOD:
        {
          return kGOOD;
        }
        break;
      case Rating.FAIR:
        {
          return kFAIR;
        }
        break;
      /*case Rating.POOR:
        {
          return Color(0xffCDCDCD);
        }
        break;
      case Rating.BAD:
        {
          return Color(0xffCDCDCD);
        }
        break;
      case Rating.NONE:
        {
          return Color(0xffCDCDCD);
        }
        break;
       */
      default:
        {
          return kNONE;
        }
    }
  }

  colorForFourthCard(Rating rating) {
    switch (rating) {
      case Rating.TOP:
        {
          return kTOP;
        }
        break;
      case Rating.GOOD:
        {
          return kGOOD;
        }
        break;
      /*case Rating.FAIR:
        {
          return Color(0xffCDCDCD);
        }
        break;
      case Rating.POOR:
        {
          return Color(0xffCDCDCD);
        }
        break;
      case Rating.BAD:
        {
          return Color(0xffCDCDCD);
        }
        break;
      case Rating.NONE:
        {
          return Color(0xffCDCDCD);
        }
        break;
       */
      default:
        {
          return kNONE;
        }
    }
  }

  colorForFifthCard(Rating rating) {
    switch (rating) {
      case Rating.TOP:
        {
          return kTOP;
        }
        break;
      /*case Rating.GOOD:
        {
          return Color(0xffCDCDCD);
        }
        break;
      case Rating.FAIR:
        {
          return Color(0xffCDCDCD);
        }
        break;
      case Rating.POOR:
        {
          return Color(0xffCDCDCD);
        }
        break;
      case Rating.BAD:
        {
          return Color(0xffCDCDCD);
        }
        break;
      case Rating.NONE:
        {
          return Color(0xffCDCDCD);
        }
        break;
       */
      default:
        {
          return kNONE;
        }
    }
  }
}

whatRaiting(String r) {
  switch (r) {
    case "TOP":
      {
        return Rating.TOP;
      }
      break;
    case "GOOD":
      {
        return Rating.GOOD;
      }
      break;
    case "FAIR":
      {
        return Rating.FAIR;
      }
      break;
    case "POOR":
      {
        return Rating.POOR;
      }
      break;
    case "BAD":
      {
        return Rating.BAD;
      }
      break;
    case "NONE":
      {
        return Rating.NONE;
      }
      break;

    default:
      {
        return Rating.NONE;
      }
  }
}

class SmallCard extends StatelessWidget {
  final Rating rating;
  final width;
  final height;
  final color;

  const SmallCard({Key key, this.rating, this.width, this.height, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        margin: EdgeInsets.zero,
        color: color,
      ),
    );
  }
}
