import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:investors/search/Location.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

class SearchCriteria extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SearchCriteriaState();
}

class SearchCriteriaState extends State<SearchCriteria>
    with SingleTickerProviderStateMixin {
  static const _BASE_ENDPOINT =
      'https://bhh9vcma76.execute-api.eu-central-1.amazonaws.com/sandbox/';
  static const _PANEL_HEADER_HEIGHT = 32.0;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      duration: const Duration(milliseconds: 100),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          title: new Text("Private Investors Portal"),
          /*leading: new IconButton(
            onPressed: () {
              _animationController.fling(
                velocity: _isPanelVisible ? -1.0 : 1.0,
              );
            },
            icon: new AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: _animationController.view,
            ),
          ),*/
        ),
        body: new SafeArea(
          child: new LayoutBuilder(
            builder: _buildStack,
          ),
        ),
      );

  bool get _isPanelVisible {
    final AnimationStatus status = _animationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final Animation<RelativeRect> animation = _getPanelAnimation(constraints);
    final ThemeData theme = Theme.of(context);

    return new Container(
      color: theme.primaryColor,
      child: new Stack(
        children: <Widget>[
          new Center(
            child: new Text("base"),
          ),
          new PositionedTransition(
            rect: animation,
            child: new Material(
              borderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(16.0),
                topRight: const Radius.circular(16.0),
              ),
              elevation: 12.0,
              child: new Column(
                children: <Widget>[
                  /*new Container(
                    alignment: new Alignment(0.0, 0.0),
                    height: _PANEL_HEADER_HEIGHT,
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(16.0),
                          child: const Text("Search"),
                        ),
                      ],
                    ),
                  ),*/
                  new Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: new Padding(
                            padding: EdgeInsets.all(16.0),
                            child: new SimpleAutocompleteFormField<Location>(
                              itemBuilder: (context, item) => new Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    child: new Text(item.label),
                                  ),
                              onSearch: _getAutocompleteLocations,
                              onChanged: (selected) {
                                print("selected $selected");
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: new Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                            child: new RaisedButton(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: const Text(
                                  "Search",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              color: const Color(0xE6FF7500),
                              onPressed: () {
                                print("pressed");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Location>> _getAutocompleteLocations(String search) async {
    final response = await get(
        '$_BASE_ENDPOINT/geo-auto-complete?t=quarterOrTown&i=$search');

    if (response.statusCode == 200) {
      return Envelope.fromJson(json.decode(response.body)).locations;
    } else {
      throw Exception('Failed to load locations');
    }
  }

  Animation<RelativeRect> _getPanelAnimation(BoxConstraints constraints) {
    final double height = constraints.biggest.height;
    final double top = height - _PANEL_HEADER_HEIGHT;
    final double bottom = -_PANEL_HEADER_HEIGHT;

    final Animation<double> animation = new CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );

    final Tween<RelativeRect> tween = new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(0.0, top, 0.0, bottom),
      end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    );

    return tween.animate(animation);
  }

  @override
  void dispose() {
    super.dispose();
    //_animationController.dispose();
  }
}
