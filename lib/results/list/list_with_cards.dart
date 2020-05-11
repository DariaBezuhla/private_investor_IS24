import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_card.dart';
import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';


import '../../constant.dart';


class ListWithCardsSliver extends StatelessWidget {
  final List<RealEstateObject> resultsList;
  final String theme; // for 'Dark' or 'Light' Theme

  const ListWithCardsSliver({
    Key key,
    this.resultsList,
    this.theme,
  }) : super(key: key);

  List<Widget> _buildDestinationBanners() {
    return resultsList.map((house) {
      return RealEstateCard(
        house: house,
        theme: theme,
        //onSelected: onSelected,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    //colors for 'Dark' or 'Light' Theme
    var backgroundColor =
    (this.theme == 'Dark') ? dBackgroundColor : kBackgroundLight;

    return  SliverList(
      delegate: SliverChildListDelegate(
        resultsList == null
            ? <Widget>[]
            : resultsList.map((house) {
          return RealEstateCard(house: house,
            theme: theme,);
        }).toList(),
      ),



    );
  }
}