import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_detail_context.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';
import 'package:privateinvestorsmobile/results/card/view_states.dart';
import 'package:privateinvestorsmobile/wishlist/favorites.dart';
import '../constant.dart';
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
  @override
  Widget build(BuildContext context) {
    bool isPressed =  Favorites.savedFavorites.contains(widget.house.id);
    var pressedFavoriteIcon = Icon(
      Icons.favorite,
      size: 24,
      color: kError,
    );
    var favoriteIcon = (!isPressed)
        ? Icon(
      SystemIconsIS.is24_system_48px_heart_favorite,
      color: kIcon,
      size: 24.0,
    ) : pressedFavoriteIcon; //Icon(Icons.favorite, size: 24, color: kTeal,);


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

    };

    return ListView(
      children: <Widget>[
        //Image -> later Image Slider
        Hero(
          tag: '${widget.house.id}-img',
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300.0,
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
              padding: EdgeInsets.all(14),
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
                      title: widget.house.title,
                      viewState: ViewState.enlarged,
                      largeFontSize: 18.0,
                      textStyle: header4,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          widget.house.address,
                          style: styleText,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Spacer(),
                      Container(
                          height: 24.0,
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
              margin: EdgeInsets.only(bottom: 24),
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
                                "Kaufpreis", widget.house.price),
                            SizedBox(height: 24),
                            _buildInfoItem1("Aktuelle Miete", "--- €")
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
                                "Preis pro m²", widget.house.pricePerSqm),
                            SizedBox(height: 24),
                            _buildInfoItem1("Hausgeld", "--- €")
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
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: kBackground))),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            _buildInfoItem1("Nettorendite", "--- %"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            _buildInfoItem1("Gesch. Kaltmiete", "--- €"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            _buildInfoItem1("X-fache Miete", "--")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Row(
                      children: <Widget>[
                        _buildInfoItem2("Mietpreis-\nentwicklung",
                            "${widget.house.priceTrend}", !widget.house.priceTrend.toString().contains("-")),
                        VerticalDivider(
                          thickness: 1,
                          color: kBackground,
                        ),
                        _buildInfoItem2("Kaufpreis-\nentwicklung",
                            "${widget.house.rentTrend}", !widget.house.rentTrend.toString().contains("-"))
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
          padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
          child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceEvenly,
              children: _buildInfoItem3([
                "${widget.house.livingSpace}",
                "${widget.house.rooms} Zimmer",
                "Aufzug",
              ])),
        ),

        //calculator button
        FractionallySizedBox(
          widthFactor: 0.95,
          child: KostenrechnerButton(theme: "light"),
        ),

        //object description
        Container(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDescriptionItem('Objektbeschreibung',
                  'Bei dem Objekt handelt es sich um einen vollständig sanierten und gepflegten Altbau in zentral innerstädtischer Lage. Die großzügige, in Kürze bezugsfrei werdende Wo … '),
              _buildDescriptionItem('Ausstattung',
                  'Bei dem Objekt handelt es sich um einen vollständig sanierten und gepflegten Altbau in zentral innerstädtischer Lage. Die großzügige, in Kürze bezugsfrei werdende Wo … '),
              _buildDescriptionItem('Ort',
                  'Zur Beachtung: Die Bilder zeigen eine andere Wohnung in diesem Objekt und Hausteil mit der nahezu identischen Ausstattungsqualität und nahezu identischen räumlichen Aufteilung bzw. Wohnfläche.'),
            ],
          ),
        ),

        //maps
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
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
                        padding: const EdgeInsets.all(24),
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
                padding: const EdgeInsets.only(left: 24, bottom: 24),
                child: ButtonTheme(
                  child: FlatButton(
                    color: kTeal,
                    textColor: kCharcoal,
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      /*...*/
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

  Container _buildInfoItemForPriceWithTransition(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Hero(
            tag: '${widget.house.id}-price',
            child: DetailsStyle(
              title: value,
              viewState: ViewState.enlarged,
              largeFontSize: 18.0,
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

  Container _buildInfoItemForPriceProMWithTransition(
      String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Hero(
            tag: '${widget.house.id}-pricePerSqm',
            child: DetailsStyle(
              title: value,
              viewState: ViewState.enlarged,
              largeFontSize: 18.0,
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

  Container _buildInfoItem1(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Text(
            value,
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

  Expanded _buildInfoItem2(String title, String value, bool isPositive) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              isPositive
                  ? SystemIconsIS.is24_system_48px_arrow_up
                  : SystemIconsIS.is24_system_48px_arrow_down,
              color: isPositive ? Colors.green[700] : Colors.red[700],
              size: 20,
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                value,
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
        .map(
          (e) => Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                width: 5.0,
                height: 28.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 19, top: 14, right: 24, bottom: 10),
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
          padding: const EdgeInsets.only(
            left: 24,
            bottom: 14,
            right: 24,
          ),
          child: Text(
            description,
            style: styleText,
          ),
        ),
        Container(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
            child: Divider(color: kLightGrey)),
      ],
    );
  }
}
