import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/constant.dart';
import  'package:keyboard_actions/keyboard_actions.dart';
import '../constant.dart';

class NormalTextField extends StatefulWidget {
  final String topNormalValue;
  final String normalFieldValue;
  ValueChanged<String> customHead;
  ValueChanged<String> customWert;

  //For Filters -> transportation user wishes to Results List
  final Function() function;
  final String filterName;

  NormalTextField({
    Key key,
    this.topNormalValue,
    this.customHead,
    this.normalFieldValue,
    this.customWert,
    this.function,
    this.filterName,
  }) : super(key: key);

  @override
  NormalTextFieldState createState() => NormalTextFieldState();
}

class NormalTextFieldState extends State<NormalTextField> {
  final myController = TextEditingController();

  //Filters with null default value
  static int budget;
  //Filters with default value
  static int netYield = 0;
  static int priceTrend = 0;
  static int rentTrend = 0;
  static int factor = 100; //factorTo 0-100
  static int pricePerSq = 1000000;
  static double rooms = 1; //1-5
  static int livingSpace = 0;

  //Validate the TextFieldForm
  final _formKey = GlobalKey<FormState>();

  bool validateInput(){
    if (_formKey.currentState.validate()) return true;
    return false;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _onEditingComplete() {
    setState(() {
      _changeValue(widget.filterName);
      widget.function();
      _formKey.currentState.validate();
      FocusScope.of(context).unfocus();
    });
  }

  void _clearTextInput() {
    myController.clear();
    _cleanValue(widget.filterName);
    widget.function();
    //FocusScope.of(context).unfocus();
  }

 void _changeValue(String whatChange) {
    switch (whatChange) {
      case 'budget':
        {
          budget = (int.tryParse(myController.text)) ?? null;
          budget = budget > 100000000 ? 100000000 : budget;
          budget = budget < 0 ? 0 : budget;
        }
        break;
      case 'netYield':
        {
          netYield = (int.tryParse(myController.text)) ?? 0;
          netYield = netYield > 100 ? 100 : netYield;
          netYield = netYield < 0 ? 0 : netYield;
        }
        break;
      case 'priceTrend':
        {
          priceTrend = (int.tryParse(myController.text)) ?? 0;
          priceTrend = priceTrend > 100 ? 100 : priceTrend;
          priceTrend = priceTrend < 0 ? 0 : priceTrend;
        }
        break;
      case 'rentTrend':
        {
          rentTrend = (int.tryParse(myController.text)) ?? 0;
          rentTrend = rentTrend > 100 ? 100 : rentTrend;
          rentTrend = rentTrend < 0 ? 0 : rentTrend;
        }
        break;
      case 'factor':
        {
          factor = (int.tryParse(myController.text)) ?? 0;
          factor = factor > 100 ? 100 : factor;
          factor = factor < 0 ? 0 : factor;
        }
        break;
      case 'pricePerSq':
        {
          pricePerSq = (int.tryParse(myController.text)) ?? null;
          pricePerSq = pricePerSq > 1000000 ? 1000000 : pricePerSq;
          pricePerSq = pricePerSq < 0 ? 0 : pricePerSq;
        }
        break;
      case 'rooms':
        {
          rooms = (double.tryParse(myController.text)) ?? null;
          rooms = rooms > 5 ? 5 : rooms;
          rooms = rooms < 0 ? 0 : rooms;
        }
        break;
      case 'livingSpace':
        {
          livingSpace = (int.tryParse(myController.text)) ?? null;
          livingSpace = livingSpace > 10000 ? 10000 : livingSpace;
          livingSpace = livingSpace < 0 ? 0 : livingSpace;
        }
        break;
      default:
        {}
        break;
    }
  }

  void _cleanValue(String whatChange) {
    switch (whatChange) {
      case 'budget':
        {
          budget = null;
        }
        break;
      case 'netYield':
        {
          netYield = 0;
        }
        break;
      case 'priceTrend':
        {
          priceTrend = 0;
        }
        break;
      case 'rentTrend':
        {
          rentTrend = 0;
        }
        break;
      case 'factor':
        {
          factor = 100;
        }
        break;
      case 'pricePerSq':
        {
          pricePerSq = 1000000;
        }
        break;
      case 'rooms':
        {
         rooms = 1;
        }
        break;
      case 'livingSpace':
        {
          livingSpace = 0;
        }
        break;

      default:
        {}
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key:  _formKey,
      child: Material(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.topNormalValue,
                style: CustomStyle.textFieldHeader(context),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),
            Theme(
              data: new ThemeData(
                primaryColor:kTeal,
                primaryColorDark: kTeal,
              ),
              child: new TextFormField(
                controller: myController,
                textInputAction: TextInputAction.go,
                //keyboardType: TextInputType.number,
                //inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                decoration: new InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,//kDivider,
                    ),
                  ),
                  labelText: widget.normalFieldValue,
                  labelStyle: CustomStyle.textFieldInsideHeader(context),
                ),
                onChanged: widget.customWert,
                onEditingComplete: _onEditingComplete,
                onTap: _clearTextInput,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter butget';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
