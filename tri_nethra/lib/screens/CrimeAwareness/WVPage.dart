import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WVP extends StatelessWidget {
  String url;
  WVP({this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(url),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.disabled,
      ),
    );
  }
}
