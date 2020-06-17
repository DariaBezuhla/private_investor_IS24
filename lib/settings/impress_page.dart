import 'package:flutter/material.dart';

import '../appBar/app_bar_with_ArrowLeft.dart';
import '../bottomBar/bottom_bar.dart';
import '../constant.dart';
import 'impress_page_content.dart';

class ImpressPage extends StatefulWidget {
  final ThemeData theme;
  final int selectedIndex;

  const ImpressPage({
    Key key,
    this.theme,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _ImpressPageState createState() => _ImpressPageState();
}

class _ImpressPageState extends State<ImpressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithArrow(),
      body: ImpressPageContent(
        theme: widget.theme,
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 2,
        theme: light,
      ),
    );
  }
}
