import 'package:flutter/material.dart';

import '../appBar/app_bar_with_ArrowLeft.dart';
import '../bottomBar/bottom_bar.dart';
import '../constant.dart';
import 'tracking_information_content.dart';

class TrackingInformation extends StatefulWidget {
  final ThemeData theme;
  final int selectedIndex;

  const TrackingInformation({
    Key key,
    this.theme,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _TrackingInformationState createState() => _TrackingInformationState();
}

class _TrackingInformationState extends State<TrackingInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithArrow(),
      body: TrackingInformationContent(
        theme: widget.theme,
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 2,
        theme: light,
      ),
    );
  }
}
