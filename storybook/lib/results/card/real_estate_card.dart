import 'package:flutter/material.dart';
import 'package:magic_8_ball/results/card/real_estate_detail_context.dart';
import 'package:magic_8_ball/results/card/real_estate_object.dart';
import 'package:magic_8_ball/results/card/view_states.dart';
import 'package:magic_8_ball/icons/system_icons_i_s_icons.dart';

import '../../constant.dart';

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
    bool isPressed = saved.contains(widget.house);
    var width = MediaQuery.of(context).size.width;
    var widthOfTrendsContainer = (3 * width - 170) / 11;
    var widthOfImage = width - 40 - widthOfTrendsContainer;
    const hightOfImage = 169.0;

    //colors and textStyles for light and dark theme
    var cardColor = (widget.theme == 'Dark') ? dCardsColor : kCard;
    var styleHeader4 = (widget.theme == 'Dark') ? dHeader4 : header4;
    var styleDescription =
        (widget.theme == 'Dark') ? dStyleDescriptionText : styleDescriptionText;
    var elevation = (widget.theme == 'Dark') ? 0.0 : 2.0;
    var iconsColor = (widget.theme == 'Dark') ? dTextColorLight : null;

    var pressedFavoriteIcon = (widget.theme == 'Dark')
        ? Icon(
            Icons.favorite,
            size: 24,
            color: kTeal,
          )
        : new Image.asset(
            "assets/icons/favorite.png",
            width: 20,
          );
    var favoriteIcon = (!isPressed)
        ? Icon(
            SystemIconsIS.is24_system_48px_heart_favorite,
            color: iconsColor,
            size: 24.0,
          )
        : pressedFavoriteIcon; //Icon(Icons.favorite, size: 24, color: kTeal,);

    arrowUp() => SizedBox(
          height: 15.0,
          width: 15.0,
          child: Image.asset(
            'assets/icons/arrow_up.png',
            color: kTeal,
          ),
        );

    arrowDown() => SizedBox(
          height: 15.0,
          width: 15.0,
          child: Image.asset(
            'assets/icons/arrow_down.png',
            color: kError,
          ),
        );

    void _saveInWishList() {
      setState(() //<--whenever icon is pressed, force redraw the widget
          {
        if (saved.contains(widget.house))
          saved.remove(widget.house);
        else
          saved.add(widget.house);
      });
    }

    ;

    List elementsInRow3 = [
      Padding(
        // 3.1
        padding: const EdgeInsets.only(top: 10.0),
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
                  title: widget.house.price,
                  isOverflow: true,
                  viewState: flightDirection == HeroFlightDirection.push
                      ? ViewState.enlarge
                      : ViewState.shrink,
                  smallFontSize: 18.0,
                  largeFontSize: 24.0,
                  textStyle: styleHeader4,
                );
              },
              child: DetailsStyle(
                title: widget.house.price,
                viewState: ViewState.shrunk,
                smallFontSize: 18.0,
                largeFontSize: 24.0,
                textStyle: styleHeader4,
              ),
            ),
            Text(
              'Kaufpreis',
              style: styleDescription,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
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
                  title: widget.house.pricePerSqm,
                  isOverflow: true,
                  viewState: flightDirection == HeroFlightDirection.push
                      ? ViewState.enlarge
                      : ViewState.shrink,
                  smallFontSize: 18.0,
                  largeFontSize: 18.0,
                  textStyle: styleHeader4,
                );
              },
              child: DetailsStyle(
                title: widget.house.pricePerSqm,
                viewState: ViewState.shrunk,
                smallFontSize: 18.0,
                largeFontSize: 18.0,
                textStyle: styleHeader4,
              ),
            ),
            Text(
              'Preis pro m²',
              style: styleDescription,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    ];

    return Padding(
      //p1
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Material(
        color: cardColor,
        elevation: elevation,
        shadowColor: kShadow,
        borderRadius: BorderRadius.circular(3.0),
        child: Padding(
          //p2
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
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
                      child: Container(
                        width: widthOfImage,
                        height: hightOfImage,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: AssetImage(widget.house.pictureUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        //1.2.1
                        width: widthOfTrendsContainer,
                        height: hightOfImage / 2,
                        child: Padding(
                          //p3
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              widget.house.priceTrend < 0
                                  ? arrowDown()
                                  : arrowUp(),
                              const SizedBox(height: 3.0),
                              Text(
                                '${widget.house.priceTrend.toString()} %',
                                style: styleHeader4,
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Mietpreis-entwicklung',
                                textAlign: TextAlign.left,
                                style: styleDescription,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        //1.2.2
                        width: widthOfTrendsContainer,
                        height: hightOfImage / 2,
                        child: Padding(
                          //p4
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            left: 10.0,
                            right: 10.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              widget.house.rentTrend < 0
                                  ? arrowDown()
                                  : arrowUp(),
                              const SizedBox(height: 3.0),
                              Text(
                                '${widget.house.rentTrend.toString()} %',
                                style: styleHeader4,
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Kaufpreis-entwicklung',
                                textAlign: TextAlign.left,
                                style: styleDescription,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
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
                      title: widget.house.title,
                      isOverflow: true,
                      viewState: flightDirection == HeroFlightDirection.push
                          ? ViewState.enlarge
                          : ViewState.shrink,
                      textStyle: styleHeader4,
                      smallFontSize: 18.0,
                      largeFontSize: 18.0,
                    );
                  },
                  child: DetailsStyle(
                    title: widget.house.title,
                    viewState: ViewState.shrunk,
                    smallFontSize: 18.0,
                    largeFontSize: 18.0,
                    textStyle: styleHeader4,
                  ),
                ),
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
                            elementsInRow3[1]
                          ],
                          spacing: 15.0,
                        ),
                  Spacer(),
                  IconButton(
                      iconSize: 65,
                      icon: favoriteIcon,
                      onPressed: () {
                        _saveInWishList();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
