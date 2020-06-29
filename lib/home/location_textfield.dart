import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:privateinvestorsmobile/home/location.dart';
import 'auto_complete_location.dart';
import '../constant.dart';
import 'package:easy_localization/easy_localization.dart';

class LocationTextField extends StatefulWidget {
  final String topValue;
  final String textFieldValue;
  final String location;
  ValueChanged<String> customHead;
  ValueChanged<String> customWert;

  //For Filters -> transportation user wishes to Results List
  final Function() function;

  LocationTextField(
      {Key key,
      this.topValue,
      this.customHead,
      this.textFieldValue,
      this.customWert,
      this.location, this.function}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new LocationInputFieldState();
}

class LocationInputFieldState extends State<LocationTextField> {
  AutoCompleteLocationService _autoCompleteLocationService;
  TextEditingController _controller;
  String _geoCodes;
  Timer _timer;
  String _input;
  bool _choseLocation;
  bool focusedInputField = true;
  FocusNode _myFocusNode;
  // For User Filters transition into Results List
  static int geoCode;

  //Validate the TextFieldForm
  final _formKey = GlobalKey<FormState>();
  bool validateInput(){
    if (_formKey.currentState.validate()) return true;
    return false;
  }

  void initState() {
    super.initState();
    _myFocusNode = FocusNode();
    setState(() {
      _controller = TextEditingController(text: widget.location);
      _choseLocation = false;
      _autoCompleteLocationService = AutoCompleteLocationService();
    });
    setState(() {});
      // print('userlocation:' + widget.location);
  }

  void dispose() {
    super.dispose();
    _timer.cancel();
    _myFocusNode.dispose();
  }

  //clear Text Field when new value
  void _clearTextInput(){
    _controller.clear();
    geoCode = null;
    widget.function();
    //FocusScope.of(context).unfocus();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            focusedInputField = false;
          });
        },
        child: Form(
          key: _formKey,
          child: Material(
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
                Column(
                  children: <Widget>[
                    new TextFormField(
                        focusNode: _myFocusNode,
                        controller: _controller,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kLightGrey,
                              ),
                            ),
                            labelText: widget.textFieldValue,
                            labelStyle: CustomStyle.inputPlaceholder(context)),
                        onEditingComplete: () {
                          _myFocusNode.unfocus();
                          focusedInputField = false;
                        },
                        onChanged: (it) {
                          if (it.length >= 2) {
                            _timer = Timer(
                              const Duration(milliseconds: 500),
                              () {
                                setState(() {
                                  _input = it;
                                  _choseLocation = false;
                                  focusedInputField = true;
                                });
                              },
                            );
                          }
                        },
                      onTap: _clearTextInput,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'enterRegion'.tr().toString();
                        }
                        return null;
                      },
                        ),
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
                                  if (snapshot.hasData &&
                                      !_choseLocation &&
                                      focusedInputField) {
                                    return Material(
                                      child: _buildListView(context,
                                          snapshot.data, (it) => _geoCodes = it),
                                    );
                                  }
                                  return Container();
                              }
                            },
                          )
                        : Container()
                  ],
                ),
              ],
            ),
          ),
        ));
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

      //For User Filer -> transition to Results List
      geoCode = int.tryParse(_geoCodes) ?? null;
      widget.function();
      _formKey.currentState.validate();
      FocusScope.of(context).unfocus();
    });
  }
}
