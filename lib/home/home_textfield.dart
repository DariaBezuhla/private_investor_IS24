import 'dart:async';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/home/location.dart';
import 'auto_complete_location.dart';

class HomeTextField extends StatefulWidget {
  final String topValue;
  final String textFieldValue;
  ValueChanged<String> customHead;
  ValueChanged<String> customWert;

  HomeTextField(
      this.topValue, this.customHead, this.textFieldValue, this.customWert);

  @override
  State<StatefulWidget> createState() => new _HomeInputField();
}

class _HomeInputField extends State<HomeTextField> {
  AutoCompleteLocationService _autoCompleteLocationService;
  TextEditingController _controller;
  String _geoCodes;
  Timer _timer;
  String _input;
  bool _choseLocation;

  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
    _choseLocation = false;
    _autoCompleteLocationService = AutoCompleteLocationService();
  }

  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.topValue,
              style: TextStyle(
                backgroundColor: Colors.transparent,
                fontFamily: 'MakeItSans',
                fontWeight: FontWeight.normal,
                fontSize: MediaQuery.of(context).size.height * 0.017,
                height: MediaQuery.of(context).size.height * 0.0007,
                color: kLightGrey2,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.012,
          ),
          Theme(
            data: new ThemeData(
              primaryColor: kTeal,
              primaryColorDark: kTeal,
            ),
            child: Column(
              children: <Widget>[
                new TextFormField(
                    controller: _controller,
                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kLightGrey,
                          ),
                        ),
                        labelText: widget.textFieldValue,
                        labelStyle: TextStyle(
                            color: kLightGrey,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.014)),
                    onChanged: (it) {
                      if (it.length >= 2) {
                        _timer = Timer(
                          const Duration(milliseconds: 500),
                          () {
                            setState(() {
                              _input = it;
                              _choseLocation = false;
                            });
                          },
                        );
                      }
                    }),
                (!_choseLocation)
                    ? FutureBuilder(
                        future: _autoCompleteLocationService
                            .fetchAutocompleteLocation(location: _input),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return Column(
                                children: <Widget>[
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ],
                              );
                            default:
                              if (snapshot.hasError) {
                                return Text("Error: ${snapshot.error}");
                              }
                              if (snapshot.hasData && !_choseLocation) {
                                return Material(
                                  child: _buildListView(context, snapshot.data,
                                      (it) => _geoCodes = it),
                                );
                              }
                              return Container();
                          }
                        },
                      ) : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(BuildContext context, List<Location> locations, ValueChanged<String> onValueChanged) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final location = locations[index];
        return FlatButton(
          onPressed: () {
            applyStateChanges(location);
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(location.getLabel()),
          ),
        );
      },
    );
  }

  void applyStateChanges(Location location) {
    setState(() {
      _geoCodes = location.getGeoId();
      _input = location.getLabel();
      _choseLocation = true;
      _controller.text = location.getLabel();
    });
  }
}
