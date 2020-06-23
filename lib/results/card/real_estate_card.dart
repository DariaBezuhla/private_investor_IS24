import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:intl/intl.dart';
import 'package:privateinvestorsmobile/results/card/ranking_button.dart';
import 'package:privateinvestorsmobile/wishlist/favorites.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../results/card/real_estate_detail_context.dart';
import '../../results/card/real_estate_object.dart';
import '../../results/card/view_states.dart';
import '../../icons/system_icons_i_s_icons.dart';
import '../../constant.dart';
import 'package:easy_localization/easy_localization.dart';

//Must be Stateful for saving in Favorite List (Wish List)
class RealEstateCard extends StatefulWidget {
  final RealEstateObject house;
  final Function(RealEstateObject) onSelected;
  final String theme; //for 'Dark' or 'Light' Theme

  const RealEstateCard({
    Key key,
    this.house,
    this.onSelected,
    this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {}

  @override
  _RealEstateCardState createState() => _RealEstateCardState();
}

class _RealEstateCardState extends State<RealEstateCard> {
  @override
  Widget build(BuildContext context) {
    var currencyFormatter = new NumberFormat.currency(
        locale: "de_DE", symbol: "€", decimalDigits: 0, name: "EUR");
    var numberFormatter = new NumberFormat("###.##", "de_DE");
    var width = MediaQuery.of(context).size.width;
    bool isPressed = Favorites.savedFavorites.contains(widget.house.id);
    var widthOfTrendsContainer = (3 * width - ScreenUtil().setWidth(170)) / 11;
    //(ScreenUtil().setWidth(3) * width - width * 0.4) / width * ScreenUtil().setWidth(37);
    var widthOfImage =
        width - ScreenUtil().setWidth(40) - widthOfTrendsContainer;
    var heightOfImage = ScreenUtil().setHeight(160);

    //colors and textStyles for light and dark theme
    var cardColor = (widget.theme == 'Dark') ? dCardsColor : kCard;
    var styleHeader4 = (widget.theme == 'Dark')
        ? CustomStyle.dHeader4(context)
        : CustomStyle.header4(context);
    var styleHeaderForTablets = (widget.theme == 'Dark')
        ? CustomStyle.dDescriptionText(context)
        : CustomStyle.styleTextForTablets(context);
    var styleDescription = (widget.theme == 'Dark')
        ? CustomStyle.dDescriptionText(context)
        : CustomStyle.descriptionText(context);
    var elevationSize = (widget.theme == 'Dark') ? dElevation : elevation;
    var iconsColor = (widget.theme == 'Dark') ? dTextColorLight : null;

    var pressedFavoriteIcon = Icon(
      Icons.favorite,
      size: ScreenUtil().setWidth(24),
      color: kError,
    );
    var favoriteIcon = (!isPressed)
        ? Icon(
            SystemIconsIS.is24_system_48px_heart_favorite,
            color: iconsColor,
            size: ScreenUtil().setWidth(24),
          )
        : pressedFavoriteIcon; //Icon(Icons.favorite, size: 24, color: kTeal,);

    arrowUp() => SizedBox(
          height: ScreenUtil().setHeight(12),
          width: ScreenUtil().setHeight(12),
          child: Image.asset(
            'assets/icons/arrow_up.png',
            color: kTeal,
          ),
        );

    arrowDown() => SizedBox(
          height: ScreenUtil().setHeight(12),
          width: ScreenUtil().setHeight(12),
          child: Image.asset(
            'assets/icons/arrow_down.png',
            color: kError,
          ),
        );

    void _saveInWishList() {
      setState(() //<--whenever icon is pressed, force redraw the widget
          {
        if (isPressed)
          Favorites.savedFavorites.remove(widget.house.id);
        //print(MediaQuery.of(context).size.height);
        else
          Favorites.savedFavorites.add(widget.house.id);
        Favorites.saveList();
        //Favorites.loadList();
      });
    }

    ;

    List elementsInRow3 = [
      Padding(
        // 3.1
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(10),
            bottom: ScreenUtil().setHeight(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: '${widget.house.id}-price',
              flightShuttleBuilder: (
                BuildContext flightContext,
                Animation<double> animation,
                HeroFlightDirection flightDirection,
                BuildContext fromHeroContext,
                BuildContext toHeroContext,
              ) {
                return DetailsStyle(
                  title: widget.house.price.value != null
                      ? currencyFormatter.format(widget.house.price.value)
                      : "---",
                  //${currencyFormatter.currencySymbol}
                  isOverflow: true,
                  viewState: flightDirection == HeroFlightDirection.push
                      ? ViewState.enlarge
                      : ViewState.shrink,
                  smallFontSize: ScreenUtil().setHeight(18),
                  largeFontSize: ScreenUtil().setHeight(18),
                  textStyle: styleHeader4,
                );
              },
              child: DetailsStyle(
                title: widget.house.price.value != null
                    ? currencyFormatter.format(widget.house.price.value)
                    : "---",
                //${currencyFormatter.currencySymbol}
                viewState: ViewState.shrunk,
                smallFontSize: ScreenUtil().setHeight(18),
                largeFontSize: ScreenUtil().setHeight(18),
                textStyle: styleHeader4,
              ),
            ),
            Text(
              'Kaufpreis'.tr().toString(),
              style: styleDescription,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(10),
            bottom: ScreenUtil().setHeight(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: '${widget.house.id}-pricePerSqm',
              flightShuttleBuilder: (
                BuildContext flightContext,
                Animation<double> animation,
                HeroFlightDirection flightDirection,
                BuildContext fromHeroContext,
                BuildContext toHeroContext,
              ) {
                return DetailsStyle(
                  title: widget.house.pricePerSqm.value != null
                      ? currencyFormatter.format(widget.house.pricePerSqm.value)
                      : "---",
                  //${currencyFormatter.currencySymbol}
                  isOverflow: true,
                  viewState: flightDirection == HeroFlightDirection.push
                      ? ViewState.enlarge
                      : ViewState.shrink,
                  smallFontSize: ScreenUtil().setHeight(18),
                  largeFontSize: ScreenUtil().setHeight(18),
                  textStyle: styleHeader4,
                );
              },
              child: DetailsStyle(
                title: widget.house.pricePerSqm.value != null
                    ? currencyFormatter.format(widget.house.pricePerSqm.value)
                    : "---",
                //${currencyFormatter.currencySymbol}
                viewState: ViewState.shrunk,
                smallFontSize: ScreenUtil().setHeight(18),
                largeFontSize: ScreenUtil().setHeight(18),
                textStyle: styleHeader4,
              ),
            ),
            Text(
              'Preis pro m2'.tr().toString(),
              style: styleDescription,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    ];

    Column _buildNumberItem(String title, num value, String unit) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                child: arrowUp(),
              ),
              Text(
                (value != null)
                    ? ((value != 0)
                        ? "${numberFormatter.format(value)}${unit != null ? ' $unit' : ''}"
                        : " ---")
                    : " ---${unit != null ? ' $unit' : ''}",
                style: MediaQuery.of(context).size.height > 1000.0
                    ? styleHeaderForTablets
                    : styleHeader4,
              ),
            ],
          ),
          Text(
            title,
            textAlign: TextAlign.start,
            style: styleDescription,
          )
        ],
      );
    }

    Column _buildInfoItem2(String title, num value) {
      bool isPositive = !value.toString().contains("-");
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                child: isPositive ? arrowUp() : arrowDown(),
              ),
              Text(
                (value != 0)
                    ? "${numberFormatter.format(value.toInt())} %"
                    : " ---",
                style: MediaQuery.of(context).size.height > 1000.0
                    ? styleHeaderForTablets
                    : styleHeader4,
              ),
            ],
          ),
          Text(
            title,
            textAlign: TextAlign.start,
            style: styleDescription,
          )
        ],
      );
    }

    return Padding(
      //p1
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(10),
          left: ScreenUtil().setWidth(10),
          right: ScreenUtil().setWidth(10)),
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3),
              topRight: Radius.circular(3),
              bottomLeft: Radius.circular(3),
              bottomRight: Radius.circular(3)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: elevationSize,
              blurRadius: 5,
              offset: Offset(0, elevationSize), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          //p2
          padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(10),
              left: ScreenUtil().setWidth(10),
              right: ScreenUtil().setWidth(10)),
          child: Column(
            children: <Widget>[
              Row(
                //1
                children: <Widget>[
                  GestureDetector(
                    //1.1
                    onTap: () {
                      if (widget.onSelected != null) {
                        widget.onSelected(widget.house);
                      }
                    },
                    child: Hero(
                      tag: '${widget.house.id}-img',
                      /*child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteGenerator(builder: (context) {
                              return ExposeScreen(house: widget.house);
                            }),
                          );
                        }, */
                      child: Container(
                        width: widthOfImage,
                        height: heightOfImage,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: (widget.house.pictureUrl != null)
                                ? NetworkImage(widget.house.pictureUrl)
                                : NetworkImage(
                                    'https://dummyimage.com/640x360/fff/aaa'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    /*  ),
                   */
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        //1.2.1
                        width: widthOfTrendsContainer,
                        height: heightOfImage / 3,
                        child: Padding(
                          //p3
                          padding: EdgeInsets.only(
                              // top: ScreenUtil().setHeight(10),
                              left: ScreenUtil().setWidth(10),
                              right: ScreenUtil().setWidth(10)),
                          child: _buildInfoItem2(
                              "MietpreisentwicklungRes".tr().toString(),
                              widget.house.rentTrend.value == null
                                  ? 0
                                  : widget.house.rentTrend.value),
                        ),
                      ),
                      Container(
                        //1.2.2
                        width: widthOfTrendsContainer,
                        height: heightOfImage / 3,
                        child: Padding(
                          //p3
                          padding: EdgeInsets.only(
                              //top: ScreenUtil().setHeight(10),
                              left: ScreenUtil().setWidth(10),
                              right: ScreenUtil().setWidth(10)),
                          child: _buildInfoItem2(
                              "KaufpreisentwicklungRes".tr().toString(),
                              widget.house.priceTrend.value == null
                                  ? 0
                                  : widget.house.priceTrend.value),
                        ),
                      ),
                      Container(
                        //widget.house.rentTrend.value
                        //1.2.3
                        width: widthOfTrendsContainer,
                        height: heightOfImage / 3,
                        child: Padding(
                          //p4
                          padding: EdgeInsets.only(
                              // top: ScreenUtil().setHeight(10),
                              left: ScreenUtil().setWidth(10),
                              right: ScreenUtil().setWidth(10)),
                          child: _buildNumberItem(
                              "X-fache Miete".tr().toString(),
                              widget.house.factor.value,
                              null),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: widthOfImage,
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(10),
                    ),
                    child: Hero(
                      tag: '${widget.house.id}-title',
                      flightShuttleBuilder: (
                        BuildContext flightContext,
                        Animation<double> animation,
                        HeroFlightDirection flightDirection,
                        BuildContext fromHeroContext,
                        BuildContext toHeroContext,
                      ) {
                        return DetailsStyle(
                          title: widget.house?.title ?? "",
                          isOverflow: true,
                          viewState: flightDirection == HeroFlightDirection.push
                              ? ViewState.enlarge
                              : ViewState.shrink,
                          textStyle: styleHeader4,
                          smallFontSize: ScreenUtil().setHeight(18),
                          largeFontSize: ScreenUtil().setHeight(18),
                        );
                      },
                      child: DetailsStyle(
                        title: widget.house?.title ?? "",
                        viewState: ViewState.shrunk,
                        smallFontSize: ScreenUtil().setHeight(18),
                        largeFontSize: ScreenUtil().setHeight(18),
                        textStyle: styleHeader4,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                      height: ScreenUtil().setHeight(24),
                      child: GestureDetector(
                          onTap: () {
                            _saveInWishList();
                          },
                          child: favoriteIcon)),
                ],
              ),
              Row(
                //3
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  widget.house.price.toString().length >= 23
                      ? elementsInRow3[0]
                      : Wrap(
                          children: <Widget>[
                            elementsInRow3[0],
                            SizedBox(
                              width: ScreenUtil().setWidth(10),
                            ),
                            elementsInRow3[1]
                          ],
                          spacing: 15.0,
                        ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(10),
                      bottom: ScreenUtil().setHeight(10),
                    ),
                    child: RatingButton(objectRating: widget.house.rating),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
