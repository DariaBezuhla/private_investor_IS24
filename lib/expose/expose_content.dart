 import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:intl/intl.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_detail_context.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';
import 'package:privateinvestorsmobile/results/card/view_states.dart';
import 'package:privateinvestorsmobile/wishlist/favorites.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

import '../constant.dart';
import '../network/search_service.dart';
import 'exposeObject.dart';
import 'kostenrechner_widget.dart';

class ExposeContent extends StatefulWidget {
  final RealEstateObject house;


  const ExposeContent({
    Key key,
    @required this.house,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {}

  @override
  ExposeContentState createState() => ExposeContentState();
}

class ExposeContentState extends State<ExposeContent> {
  ExposeObject _exposeObject;
  var fetchedKaltmiete;
  SearchService _searchService = new SearchService();
  var zimmer = 'Zimmer'.tr().toString();
  var aufzug = 'Aufzug'.tr().toString();
  var balkon = 'Balkon'.tr().toString();
  var keller = 'Keller'.tr().toString();
  var garten = 'Garten'.tr().toString();
  var weitereFragen= 'Weitere Fragen zur Immobilie?'.tr().toString();
  var geschKaltmiete = 'GeschKaltmiete'.tr().toString();
  var currencyFormatter = new NumberFormat.currency(
      locale: "de_DE", symbol: "€", decimalDigits: 0, name: "EUR");
  var numberFormatter = new NumberFormat("###.##", "de_DE");
  @override
  void initState() {
    super.initState();

    _searchService.fetchEstate(id: widget.house.id).then((value) {
      setState(() {
        _exposeObject = value;
        fetchedKaltmiete = _exposeObject?.rentAbsolute?.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPressed = Favorites.savedFavorites.contains(widget.house.id);
    Size size = MediaQuery.of(context).size;
    var pressedFavoriteIcon = Icon(
      Icons.favorite,
      size: ScreenUtil().setWidth(24),
      color: kError,
    );
    var favoriteIcon = (!isPressed)
        ? Icon(
            SystemIconsIS.is24_system_48px_heart_favorite,
            color: kIcon,
            size: ScreenUtil().setWidth(24),
          )
        : pressedFavoriteIcon; //Icon(Icons.favorite, size: 24, color: kTeal,);

    void _saveInWishList() {
      setState(() //<--whenever icon is pressed, force redraw the widget
          {
        if (isPressed) //favorites.contains(widget.house.id)
          Favorites.savedFavorites.remove(widget.house.id);
        else
          Favorites.savedFavorites.add(widget.house.id);
        Favorites.saveList();
        Favorites.loadList();
      });
    }

    return ListView(
      children: <Widget>[
        SizedBox(
            height: ScreenUtil().setHeight(300),
            width: MediaQuery.of(context).size.width,
            child: _exposeObject != null ? Carousel(
                dotBgColor: Colors.transparent,
                dotVerticalPadding: 20,
                autoplay: false,
                dotSpacing: 15,
                dotSize: 7,
                images:_exposeObject?.gallery != null ? _exposeObject.gallery.map((e){
                  return NetworkImage(e.toString());
                }).toList() : [widget.house.pictureUrl]
            ) : Hero(
              tag: '${widget.house.id}-img',
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: ScreenUtil().setHeight(300),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: (widget.house.pictureUrl != null)
                        ? NetworkImage(widget.house.pictureUrl)
                        : NetworkImage('https://dummyimage.com/640x360/fff/aaa'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        ),


        //intro info
        FractionallySizedBox(
          widthFactor: 0.95,
          child: Container(
            transform: Matrix4.translationValues(0, -24.0, 0),
            decoration: BoxDecoration(
              boxShadow: shadowMd,
              borderRadius: BorderRadius.all(
                Radius.circular(2),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(
                ScreenUtil().setHeight(14),
              ),
              //color: Colors.white,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: '${widget.house.id}-title',
                    child: DetailsStyle(
                      title: _exposeObject?.title ?? "",
                      viewState: ViewState.enlarged,
                      largeFontSize: ScreenUtil().setHeight(18),
                      textStyle: CustomStyle.header4(context),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          _exposeObject?.address?.getQuarter() ?? "",
                          style: CustomStyle.styleText(context),
                          textAlign: TextAlign.left,
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
                  )
                ],
              ),
            ),
          ),
        ),

        //4 most important numbers
        FractionallySizedBox(
          widthFactor: 0.8,
          child: Container(
              margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(24)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            _buildInfoItemForPriceWithTransition(
                                "Kaufpreis".tr().toString(), _exposeObject?.price?.value),
                            SizedBox(height: ScreenUtil().setHeight(24)),
                            _buildCurrencyItem(
                                "Aktuelle Miete".tr().toString(), _exposeObject?.rent?.value)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            _buildInfoItemForPriceProMWithTransition(
                                "Preis pro m2".tr().toString(),
                                _exposeObject?.pricePerSqm?.value),
                            SizedBox(height: ScreenUtil().setHeight(24)),
                            _buildCurrencyItem(
                                "Hausgeld".tr().toString(), _exposeObject?.rentSubsidy?.value)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),

        //rest of numbers
        Container(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadowMd,
                borderRadius: BorderRadius.all(Radius.circular(2))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(ScreenUtil().setHeight(24)),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: kBackground))),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            _buildNumberItem("Nettorendite".tr().toString(),
                                _exposeObject?.netYield?.value, "%"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            _buildCurrencyItem(geschKaltmiete,
                                _exposeObject?.rentAbsolute?.value),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            _buildNumberItem("X-fache Miete".tr().toString(),
                                _exposeObject?.factor?.value, null)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.all(
                      ScreenUtil().setHeight(24),
                    ),
                    child: Row(
                      children: <Widget>[
                        _buildInfoItem2(
                          "MietpreisentwicklungRes".tr().toString(),
                          _exposeObject?.rentTrend?.value,
                        ),
                        VerticalDivider(
                          thickness: 1,
                          color: kBackground,
                        ),
                        _buildInfoItem2(
                          "KaufpreisentwicklungRes".tr().toString(),
                          _exposeObject?.priceTrend?.value,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        //props
        Container(
          padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(48),
              horizontal: ScreenUtil().setWidth(24)),
          child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceEvenly,
              children: _buildInfoItem3([
                _exposeObject != null
                    ? "${numberFormatter.format(_exposeObject?.livingSpace?.value)}m²"
                    : "",
                "${_exposeObject?.rooms?.value.toString()} $zimmer",
                "${_exposeObject?.lift == true ? "$aufzug" : ""}",
                "${_exposeObject?.balcony == true ? "$balkon" : ""}",
                "${_exposeObject?.cellar == true ? "$keller" : ""}",
                "${_exposeObject?.garden == true ? "$garten" : ""}",
              ])),
        ),

        //calculator button
        FractionallySizedBox(
          widthFactor: 0.95,
          child: KostenrechnerButton(theme: "light", fetchedKaltmiete: fetchedKaltmiete),
        ),

        //object description
        Container(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(24)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDescriptionItem('Objektbeschreibung'.tr().toString(),
                  _exposeObject?.description ?? "Keine Angaben".tr().toString()),
              _buildDescriptionItem(
                  'Ort'.tr().toString(), _exposeObject?.location ?? "Keine Angaben".tr().toString()),
            ],
          ),
        ),

        //maps
        Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24)),
          child: (_exposeObject?.coordinate != null)
              ? _buildStaticMaps(_exposeObject.coordinate.latitude,
                  _exposeObject.coordinate.longitude, size)
              : new Container(
                  width: 0,
                  height: 0,
                ),
        ),

        //contact
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(ScreenUtil().setHeight(24)),
                        child: Text(
                          weitereFragen,
                          style: CustomStyle.header4(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(ScreenUtil().setHeight(24)),
                child: ButtonTheme(
                  child: FlatButton(
                    color: kTeal,
                    textColor: kCharcoal,
                    padding: EdgeInsets.all(
                      ScreenUtil().setHeight(10),
                    ),
                    onPressed: () async {
                      if (await canLaunch('immobilienscout24://')) {
                        await launch(
                            'https://www.immobilienscout24.de/expose/${widget.house.id}',
                            forceSafariVC: false);
                      } else {
                        await launch(
                            'https://www.immobilienscout24.de/expose/${widget.house.id}',
                            forceSafariVC: true);
                      }
                    },
                    child: Text(
                      "Anbieter kontaktieren".tr().toString(),
                      style: CustomStyle.styleButton(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container _buildInfoItemForPriceWithTransition(String title, num value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
      child: Column(
        children: <Widget>[
          Hero(
            tag: '${widget.house.id}-price',
            child: DetailsStyle(
              title: value != null
                  ? currencyFormatter.format(value)
                  : "--- ${currencyFormatter.currencySymbol}",
              viewState: ViewState.enlarged,
              largeFontSize: ScreenUtil().setHeight(18),
              textStyle: CustomStyle.header4(context),
            ),
          ),
          Text(
            title,
            style: CustomStyle.descriptionText(context),
          )
        ],
      ),
    );
  }

  Container _buildInfoItemForPriceProMWithTransition(String title, num value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
      child: Column(
        children: <Widget>[
          Hero(
            tag: '${widget.house.id}-pricePerSqm',
            child: DetailsStyle(
              title: value != null
                  ? currencyFormatter.format(value)
                  : "--- ${currencyFormatter.currencySymbol}",
              viewState: ViewState.enlarged,
              largeFontSize: ScreenUtil().setHeight(18),
              textStyle: CustomStyle.header4(context),
            ),
          ),
          Text(
            title,
            style: styleDescriptionText,
          )
        ],
      ),
    );
  }

  Container _buildCurrencyItem(String title, num value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
      child: Column(
        children: <Widget>[
          Text(
            value != null
                ? currencyFormatter.format(value)
                : '--- ${currencyFormatter.currencySymbol}',
            style: header4,
          ),
          Text(
            title,
            style: CustomStyle.descriptionText(context),
          )
        ],
      ),
    );
  }

  Container _buildNumberItem(String title, num value, String unit) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
      child: Column(
        children: <Widget>[
          Text(
            value != null
                ? "${numberFormatter.format(value)}${unit != null ? ' $unit' : ''}"
                : "---${unit != null ? ' $unit' : ''}",
            style: CustomStyle.header4(context),
          ),
          Text(
            title,
            style: CustomStyle.descriptionText(context),
          )
        ],
      ),
    );
  }

  Expanded _buildInfoItem2(String title, num value) {
    bool isPositive = !value.toString().contains("-");

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
            child: Icon(
              isPositive
                  ? SystemIconsIS.is24_system_48px_arrow_up
                  : SystemIconsIS.is24_system_48px_arrow_down,
              color: isPositive ? Colors.green[700] : Colors.red[700],
              size: ScreenUtil().setWidth(20),
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                value != null ? "${numberFormatter.format(value)} %" : "--- %",
                style: CustomStyle.header4(context),
              ),
              Text(
                title,
                style: CustomStyle.descriptionText(context),
              )
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildInfoItem3(List<String> list) {
    return list
        .where((e) => e != "")
        .map(
          (e) => Container(
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(5),
              horizontal: ScreenUtil().setWidth(10),
            ),
            child: Text(
              e,
              style: CustomStyle.descriptionText(
                  context), //TextStyle(color: Colors.grey[600]),
            ),
          ),
        )
        .toList();
  }

  Column _buildDescriptionItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*2*/
        Container(
          child: Row(
            children: [
              Container(
                color: kTeal,
                width: ScreenUtil().setWidth(5),
                height: ScreenUtil().setHeight(28.0),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(19),
                      top: ScreenUtil().setHeight(14.0),
                      right: ScreenUtil().setWidth(24),
                      bottom: ScreenUtil().setHeight(10.0)),
                  child: Text(
                    title,
                    style: CustomStyle.header4(context),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(24),
            right: ScreenUtil().setWidth(24),
            bottom: ScreenUtil().setHeight(14.0),
          ),
          child: Text(
            description.toString().contains("null")
                ? "Keine Angaben"
                : "${description}",
            style: CustomStyle.styleText(context),
          ),
        ),
        Container(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(24),
              right: ScreenUtil().setWidth(24),
              bottom: ScreenUtil().setHeight(10.0),
            ),
            child: Divider(color: kLightGrey)),
      ],
    );
  }

  // renders Static Google Maps Image, if lat and lng can be found in coordinate
  Widget _buildStaticMaps(num lat, num lng, Size size) {
    return GestureDetector(
      child: Stack(
        children: <Widget>[
          Container(
            child: new Image.network(
              'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=15&size=720x400&key=$GOOGLE_MAPS_API',
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 35,
            left: size.width * 0.3125,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: kTeal.withOpacity(0.5),
                shape: BoxShape.circle
              ),
            ),
          )
        ],
      ),
      onTap: () async {
        final String googleMapsUrl = "comgooglemaps://?center=$lat,$lng";
        final String appleMapsUrl = "https://maps.apple.com/?q=$lat,$lng";

        if (await canLaunch(googleMapsUrl)) {
          await launch(googleMapsUrl);
        }
        if (await canLaunch(appleMapsUrl)) {
          await launch(appleMapsUrl, forceSafariVC: false);
        } else {
          throw "Couldn't launch URL";
        }
      },
    );
  }
}
