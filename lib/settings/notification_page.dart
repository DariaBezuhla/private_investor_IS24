import 'package:flutter/material.dart';
import '../constant.dart';
import '../appBar/app_bar_with_ArrowLeft.dart';
import '../bottomBar/bottom_bar.dart';
import 'notification_page_content.dart';

class NotificationPage extends StatefulWidget {
  final String theme;
  final int selectedIndex;

  const NotificationPage({
    Key key,
    this.theme,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithArrow(),
      body: NotificationPageContent(
        theme: widget.theme,
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 2,
        theme: light,
      ),
    );
  }
}
