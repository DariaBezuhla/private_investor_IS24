import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/theme.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DataProtectionPageContent extends StatefulWidget {
  final ThemeData theme;
  const DataProtectionPageContent({
    Key key,
    this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {}

  @override
  _DataProtectionPageContentState createState() =>
      _DataProtectionPageContentState();
}

class _DataProtectionPageContentState extends State<DataProtectionPageContent> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getTheme();
    return Container(
      child: _buildWebView(),
    );
  }

  Widget _buildWebView() {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://www.immobilienscout24.de/agb/datenschutz.html',
    );
  }
}
