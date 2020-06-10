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
  _ExposeContentState createState() => _ExposeContentState();
}

class _ExposeContentState extends State<ExposeContent> {
  ExposeObject _exposeObject;
  SearchService _searchService = new SearchService();
  var currencyFormatter = new NumberFormat.currency(
      locale: "de_DE", symbol: "€", decimalDigits: 0, name: "EUR");
  var numberFormatter = new NumberFormat("###.##", "de_DE");
  @override
  void initState() {
    super.initState();

    _searchService.fetchEstate(id: widget.house.id).then((value) {
      setState(() {
        _exposeObject = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPressed = Favorites.savedFavorites.contains(widget.house.id);
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
        //Image -> later Image Slider
        Hero(
          tag: '${widget.house.id}-img',
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: ScreenUtil().setHeight(300),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image:
                (widget.house.pictureUrl != null)
                    ? NetworkImage(widget.house.pictureUrl)
                    : NetworkImage('https://dummyimage.com/640x360/fff/aaa'),
                fit: BoxFit.cover,
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
              padding: EdgeInsets.all(ScreenUtil().setHeight(14),),
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
                      textStyle: header4,
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          _exposeObject?.address?.getQuarter() ?? "",
                          style: styleText,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Spacer(),
                      Container(
                          height:  ScreenUtil().setHeight(24),
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
              margin: EdgeInsets.only(bottom:  ScreenUtil().setHeight(24)),
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
                                "Kaufpreis", _exposeObject?.price?.value),
                            SizedBox(height: ScreenUtil().setHeight(24)),
                            _buildCurrencyItem(
                                "Aktuelle Miete", _exposeObject?.rent?.value)
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
                                "Preis pro m²",
                                _exposeObject?.pricePerSqm?.value),
                            SizedBox(height: ScreenUtil().setHeight(24)),
                            _buildCurrencyItem(
                                "Hausgeld", _exposeObject?.rentSubsidy?.value)
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
                            _buildNumberItem("Nettorendite",
                                _exposeObject?.netYield?.value, "%"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            _buildCurrencyItem("Gesch. Kaltmiete",
                                _exposeObject?.rentAbsolute?.value),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            _buildNumberItem("X-fache Miete",
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
                          "Mietpreis-\nentwicklung",
                          _exposeObject?.rentTrend?.value,
                        ),
                        VerticalDivider(
                          thickness: 1,
                          color: kBackground,
                        ),
                        _buildInfoItem2(
                          "Kaufpreis-\nentwicklung",
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
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(48), horizontal: ScreenUtil().setWidth(24)),
          child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceEvenly,
              children: _buildInfoItem3([
                _exposeObject != null
                    ? "${numberFormatter.format(_exposeObject?.livingSpace?.value)}m²"
                    : "",
                "${_exposeObject?.rooms?.value.toString()} Zimmer",
                "${_exposeObject?.lift == true ? "Aufzug" : ""}",
                "${_exposeObject?.balcony == true ? "Balkon" : ""}",
                "${_exposeObject?.cellar == true ? "Keller" : ""}",
                "${_exposeObject?.garden == true ? "Garten" : ""}",
              ])),
        ),

        //calculator button
        FractionallySizedBox(
          widthFactor: 0.95,
          child: KostenrechnerButton(theme: "light"),
        ),

        //object description
        Container(
          padding:  EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(24)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDescriptionItem('Objektbeschreibung',
                  _exposeObject?.description ?? "Keine Angaben"),
              _buildDescriptionItem(
                  'Ort', _exposeObject?.location ?? "Keine Angaben"),
            ],
          ),
        ),

        //maps
        Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24)),
          child: new Image.asset(
            "assets/images/maps.png",
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
                          'Weitere Fragen zur Immobilie?',
                          style: header4,
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
                    padding:EdgeInsets.all(
                      ScreenUtil().setHeight(10),
                    ),
                    onPressed: () async {
                      if (await canLaunch('immobilienscout24://')) {
                        await launch(
                            'https://www.immobilienscout24.de/expose/${widget.house.id}?referrer=HP_INSPIRATION_ONE#/',
                            forceSafariVC: false);
                      } else {
                        await launch(
                            'https://www.immobilienscout24.de/expose/${widget.house.id}?referrer=HP_INSPIRATION_ONE#/',
                            forceSafariVC: true);
                      }
                    },
                    child: Text("Anbieter kontaktieren", style: styleButton),
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
      padding:  EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
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
              textStyle: header4,
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
              textStyle: header4,
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
            style: styleDescriptionText,
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
            style: header4,
          ),
          Text(
            title,
            style: styleDescriptionText,
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
                style: header4,
              ),
              Text(
                title,
                style: styleDescriptionText,
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
              horizontal: ScreenUtil().setWidth(10),),
            child: Text(
              e,
              style: TextStyle(color: Colors.grey[600]),
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
                width:  ScreenUtil().setWidth(5),
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
                    style: header4,
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
            style: styleText,
          ),
        ),
        Container(
            padding:EdgeInsets.only(
              left: ScreenUtil().setWidth(24),
              right: ScreenUtil().setWidth(24),
              bottom: ScreenUtil().setHeight(10.0),
            ),
            child: Divider(color: kLightGrey)),
      ],
    );
  }
}
