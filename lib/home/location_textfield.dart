import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:privateinvestorsmobile/home/location.dart';
import 'auto_complete_location.dart';
import '../constant.dart';

class LocationTextField extends StatefulWidget {
  final String topValue;
  final String textFieldValue;
  final String location;
  ValueChanged<String> customHead;
  ValueChanged<String> customWert;
  

  LocationTextField({ this.topValue, this.customHead, this.textFieldValue, this.customWert, this.location}
     );

  @override
  State<StatefulWidget> createState() => new _LocationInputField();
}

class _LocationInputField extends State<LocationTextField> {
  AutoCompleteLocationService _autoCompleteLocationService;
  TextEditingController _controller;
  String _geoCodes;
  Timer _timer;
  String _input;
  bool _choseLocation;

  void initState() {
    super.initState();

    setState(() {
      _controller = TextEditingController(text: widget.location);
      _choseLocation = false;
      _autoCompleteLocationService = AutoCompleteLocationService();
    });
    setState(() {});
    print('userlocation:' + widget.location);
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
              style: CustomStyle.textFieldHeader(context),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
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
                        labelStyle: CustomStyle.inputPlaceholder(context)),
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
                              //
                            default:
                              if (snapshot.hasError) {
                                return Text("Error: ${snapshot.error}");
                              }
                              if (snapshot.hasData && !_choseLocation) {
                                return Material(
                                  child: _buildListView(context,
                                      snapshot.data,
                                      (it) => _geoCodes = it),
                                );
                              }
                              return Container();
                          }
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget _buildListView(BuildContext context, List<Location> locations,
    ValueChanged<String> onValueChanged) {
  return ConstrainedBox(
    constraints: BoxConstraints(maxHeight: ScreenUtil().setHeight(150)),
    child: ListView.builder(
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
    ),
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
