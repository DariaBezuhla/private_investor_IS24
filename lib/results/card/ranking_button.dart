import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/results/card/rating.dart';
import '../../constant.dart';

class RatingButton extends StatelessWidget {
  final Rating rating;

  const RatingButton({Key key, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var backgroundColor = colorForButton(rating);
    var firstSmallCardColor = colorForButton(rating);
    var secondSmallCardColor = colorForSecondCard(rating);
    var thirdSmallCardColor = colorForThirdCard(rating);
    var fourthSmallCardColor = colorForFourthCard(rating);
    var fifthSmallCardColor = colorForFifthCard(rating);

    var buttonHeight = 30.0;
    var width = MediaQuery.of(context).size.width;
    var widthOfX = (width - 160) /12;
    var widthOfY = 10.0;
    var widthOfButton = 5*widthOfX + 4*widthOfY;
    var widthOfSmallCard = (widthOfButton - 8) / 5;
    var hightOfSmallCard = 9.0;
    var text = textForButton(rating);

    return Container(
      height: buttonHeight,
      width: widthOfButton,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Container(
              width: widthOfButton,
              height: 18,
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
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: SmallCard(
                    rating: this.rating,
                    color: firstSmallCardColor,
                    width: widthOfSmallCard,
                    height: hightOfSmallCard,
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: SmallCard(
                    rating: this.rating,
                    color: secondSmallCardColor,
                    width: widthOfSmallCard,
                    height: hightOfSmallCard,
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: SmallCard(
                    rating: this.rating,
                    color: thirdSmallCardColor,
                    width: widthOfSmallCard,
                    height: hightOfSmallCard,
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: SmallCard(
                    rating: this.rating,
                    color: fourthSmallCardColor,
                    width: widthOfSmallCard,
                    height: hightOfSmallCard,
                  )),
              SmallCard(
                rating: this.rating,
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
          return "TOP ANGEBOT";
        }
        break;
      case Rating.GOOD:
        {
          return "GUTES ANGEBOT";
        }
        break;
      case Rating.FAIR:
        {
          return "FAIRES ANGEBOT";
        }
        break;
      case Rating.POOR:
        {
          return "ETWAS TEUER";
        }
        break;
      case Rating.BAD:
        {
          return "TEUER";
        }
        break;
      case Rating.NONE:
        {
          return "KEINE ANGABE";
        }
        break;
      default:
        {
          return "KEINE ANGABE";
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

