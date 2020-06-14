import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/theme.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndConditionPageContent extends StatefulWidget {
  final String theme;
  const TermsAndConditionPageContent({
    Key key,
    this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {}

  @override
  _TermsAndConditionPageContentState createState() =>
      _TermsAndConditionPageContentState();
}

class _TermsAndConditionPageContentState
    extends State<TermsAndConditionPageContent> {
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
        initialUrl: 'https://www.immobilienscout24.de/agb/nutzungsagb.html',
        javascriptMode: JavascriptMode.unrestricted);
  }
}
