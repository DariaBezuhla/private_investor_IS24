import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:investors/results/result_details.dart';
import 'package:investors/results/summary.dart';
import 'package:investors/results/vertical_divider.dart';
import 'package:transparent_image/transparent_image.dart';

class ResultItem extends StatefulWidget {
  final Summary _expose;

  ResultItem(this._expose);

  @override
  State<StatefulWidget> createState() => ResultItemState(_expose);
}

class ResultItemState extends State<ResultItem> {
  static const _PICTURE_WIDTH = 120.0;
  static const _PICTURE_HEIGHT = 90.0;

  final _currency = NumberFormat("#,##0.00 €", "de_DE");
  final _percentage = NumberFormat("## %", "de_DE");

  final _style = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );

  final Summary _expose;

  ResultItemState(this._expose);

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Container(
            width: _PICTURE_WIDTH,
            height: _PICTURE_HEIGHT,
            child: Stack(
              children: <Widget>[
                Center(child: CupertinoActivityIndicator()),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: _expose.picture.replaceFirst(
                      "800x600>",
                      "${_PICTURE_WIDTH}x${_PICTURE_HEIGHT}",
                    ),
                    fit: BoxFit.cover,
                    width: _PICTURE_WIDTH,
                    height: _PICTURE_HEIGHT,
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
                        CupertinoButton(
                          child: Icon(CupertinoIcons.right_chevron),
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => ResultDetails(_expose.id),
                              ),
                            );
                          },
                        ),
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
