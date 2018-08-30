import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:investors/results/expose.dart';
import 'package:investors/results/vertical_divider.dart';
import 'package:transparent_image/transparent_image.dart';

class ResultItem extends StatefulWidget {
  final Expose _expose;

  ResultItem(this._expose);

  @override
  State<StatefulWidget> createState() => ResultItemState(_expose);
}

class ResultItemState extends State<ResultItem> {
  final _currency = NumberFormat("#,##0.00 €", "de_DE");
  final _percentage = NumberFormat("## %", "de_DE");
  final _style = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  final Expose _expose;

  ResultItemState(this._expose);

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Container(
            width: 120.0,
            height: 100.0,
            child: Stack(
              children: <Widget>[
                Center(child: CupertinoActivityIndicator()),
                Center(child: _getPicture(_expose.picture))
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _getAddress(_expose.address),
                  Text(
                    _expose.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _createCriteriaResult(
                          _currency.format(_expose.price.value),
                          "Price",
                        ),
                        VerticalDivider(),
                        /*_createCriteriaResult(
                          _currency.format(_expose.expectedRent.value),
                          "Rent",
                        ),
                        VerticalDivider(),*/
                        /*_createCriteriaResult(
                          _percentage.format(_expose.netYield),
                          "Yield",
                        ),
                        VerticalDivider(),*/
                        /*_createCriteriaResult(
                          "${_currency.format(_expose.pricePerSqm.value)}/m2",
                          "Price/m2",
                        ),
                        VerticalDivider(),*/
                        _createCriteriaResult("${_expose.space} m2", "Area"),
                        VerticalDivider(),
                        _createCriteriaResult("${_expose.rooms}", "Rooms"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _createCriteriaResult(String value, String label) => Column(
        children: <Widget>[
          Text(value, overflow: TextOverflow.ellipsis, style: _style),
          Text(label)
        ],
      );

  Widget _getAddress(Address address) => Text(
        "${address.postcode} ${address.city}, ${address.city}",
        style: TextStyle(color: Colors.grey),
      );

  Widget _getPicture(Picture picture) {
    if (picture.scales.isEmpty) {
      return Image.asset(
        "assets/noimage.jpg",
        fit: BoxFit.cover,
        width: 120.0,
        height: 100.0,
      );
    }

    final scale = picture.scales
        .firstWhere((it) => it.scale == "SCALE_AND_CROP")
        .href
        .replaceAll("%WIDTH%x%HEIGHT%", "120x100");

    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: scale,
      fit: BoxFit.cover,
    );
  }
}
