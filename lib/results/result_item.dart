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
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  final Expose _expose;

  ResultItemState(this._expose);

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Container(
            width: 107.0,
            height: 80.0,
            child: Stack(
              children: <Widget>[
                Center(child: CupertinoActivityIndicator()),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: _expose.picture.replaceFirst("800x600>", "107x75"),
                    fit: BoxFit.cover,
                    width: 107.0,
                    height: 80.0,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _expose.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _createCriteriaResult(
                          _currency.format(_expose.price),
                          "Price",
                        ),
                        VerticalDivider(),
                        /*_createCriteriaResult(
                          _currency.format(_expose.expectedRent),
                          "Rent",
                        ),
                        VerticalDivider(),*/
                        /*_createCriteriaResult(
                          _percentage.format(_expose.netYield),
                          "Yield",
                        ),
                        VerticalDivider(),*/
                        /*_createCriteriaResult(
                          "${_currency.format(_expose.pricePerSqm)}/m2",
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
}
