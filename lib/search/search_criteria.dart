import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investors/results/result_list.dart';
import 'package:investors/search/location.dart';
import 'package:investors/search/location_input.dart';

class SearchCriteria extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchCriteriaState();
}

class _SearchCriteriaState extends State<SearchCriteria> {
  static const _kPickerSheetHeight = 200.0;
  static const _kPickerItemHeight = 32.0;

  Location _location;
  num _yield = 2.5;
  num _price = 3.0;
  num _rent = 3.0;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            "Private Investors",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        child: SafeArea(
          child: Material(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: OutlineButton(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: _location == null
                                      ? Text(
                                          "Location",
                                          style: TextStyle(
                                            color: CupertinoColors.inactiveGray,
                                          ),
                                        )
                                      : Text("$_location"),
                                ),
                                borderSide: BorderSide(
                                  color: CupertinoColors.lightBackgroundGray,
                                  width: 1.0,
                                ),
                                onPressed: _pushLocation,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: _createCriteriaInfo(
                                  "Net Yield",
                                  "Social proof market success venture partner network. Agile development hypotheses strategy. Founders paradigm shift sales early adopters mass market disruptive angel investor buzz crowdsource MVP. Iteration gamification churn rate rockstar agile development user experience innovator lean startup first mover advantage research & development infrastructure social proof.",
                                ),
                              ),
                            ),
                            _createCriteriaValue(
                              context,
                              "from $_yield%",
                              _yield,
                              (it) {
                                setState(() {
                                  _yield = it;
                                });
                              },
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: _createCriteriaInfo(
                                  "Price Trend",
                                  "Infrastructure hypotheses user experience angel investor ramen launch party strategy client value proposition pitch stock customer advisor success. Accelerator vesting period user experience burn rate. Alpha success supply chain vesting period marketing funding non-disclosure agreement innovator low hanging fruit. Series A financing mass market lean startup A/B testing.",
                                ),
                              ),
                            ),
                            _createCriteriaValue(
                              context,
                              "from $_price%",
                              _price,
                              (it) {
                                setState(() {
                                  _price = it;
                                });
                              },
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: _createCriteriaInfo(
                                  "Rent Trend",
                                  "Prototype pitch niche market client infographic gamification incubator entrepreneur series A financing beta business plan vesting period. Disruptive investor creative startup learning curve paradigm shift release gamification holy grail value proposition business-to-consumer user experience infographic ramen. Launch party network effects ramen learning curve analytics value proposition infographic interaction design facebook mass market metrics advisor twitter agile development. Agile development handshake android infographic creative lean startup scrum project business model canvas focus value proposition business-to-consumer gen-z release.",
                                ),
                              ),
                            ),
                            _createCriteriaValue(
                              context,
                              "from $_rent%",
                              _rent,
                              (it) {
                                setState(() {
                                  _rent = it;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 12.0,
                        ),
                        child: CupertinoButton(
                          child: const Text(
                            "Search",
                            style: const TextStyle(fontSize: 15.0),
                          ),
                          color: const Color(0xE6FF7500),
                          disabledColor: CupertinoColors.inactiveGray,
                          onPressed: _location == null
                              ? null
                              : () {
                                  _pushResults(_location);
                                },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget _createCriteriaInfo(String data, String content) => FlatButton(
        child: Row(
          children: <Widget>[
            Text(data),
            const SizedBox(width: 8.0),
            const Icon(CupertinoIcons.info, size: 22.0),
          ],
        ),
        onPressed: () {
          showCupertinoDialog(
            context: context,
            builder: (context) => _createAlertDialog(data, content),
          );
        },
      );

  Widget _createAlertDialog(String data, String content) =>
      CupertinoAlertDialog(
        title: Text(data),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text("OK"),
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ],
      );

  Widget _createCriteriaValue(
    BuildContext context,
    String data,
    num selected,
    ValueChanged<num> onSelectedValueChanged,
  ) {
    return FlatButton(
      child: Row(
        children: <Widget>[
          Text(data),
          const SizedBox(width: 8.0),
          const Icon(CupertinoIcons.right_chevron, size: 22.0),
        ],
      ),
      onPressed: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (context) => Container(
                height: _kPickerSheetHeight,
                color: CupertinoColors.white,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 22.0,
                  ),
                  child: _createPicker(selected, onSelectedValueChanged),
                ),
              ),
        );
      },
    );
  }

  Widget _createPicker(
    num selected,
    ValueChanged<num> onSelectedValueChanged,
  ) =>
      GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: CupertinoPicker(
          scrollController: FixedExtentScrollController(
            initialItem: (selected * 2).toInt(),
          ),
          itemExtent: _kPickerItemHeight,
          backgroundColor: CupertinoColors.white,
          onSelectedItemChanged: (index) {
            onSelectedValueChanged(index / 2);
          },
          children: List<Widget>.generate(10, (index) {
            return Center(child: Text("${index / 2} %"));
          }),
        ),
      );

  void _pushLocation() async {
    final route = CupertinoPageRoute<Location>(
      builder: (context) => LocationInput(),
    );

    _location = await Navigator.push(context, route);
  }

  void _pushResults(Location location) => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => ResultList(location),
        ),
      );
}
