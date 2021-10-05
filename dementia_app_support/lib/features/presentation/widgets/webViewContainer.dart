import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  final title;
  WebViewContainer(this.url, this.title);
  @override
  createState() => _WebViewContainerState(this.url, this.title);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  var _title;
  final _key = UniqueKey();
  _WebViewContainerState(this._url, this._title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: _url,
            ),
          ),
          Row()
        ],
      ),
    );
  }
}



// class HelpScreen extends StatefulWidget {
//   @override
//   HelpScreenState createState() {
//     return HelpScreenState();
//   }
// }

// class HelpScreenState extends State<HelpScreen> {
//   WebViewController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Help')),
//       body: WebView(
//         initialUrl: 'about:blank',
//         onWebViewCreated: (WebViewController webViewController) {
//           _controller = webViewController;
//           _loadHtmlFromAssets();
//         },
//       ),
//     );
//   }

//   _loadHtmlFromAssets() async {
//     String fileText = await rootBundle.loadString('assets/help.html');
//     _controller.loadUrl(Uri.dataFromString(fileText,
//             mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
//         .toString());
//   }
// }

// class WebViewContainer extends StatefulWidget {
//   final url;
//   final title;
//   WebViewContainer(this.url, this.title);
//   @override
//   createState() => new _WebViewContainerState(this.url, this.title);
// }

// class _WebViewContainerState extends State<WebViewContainer> {
//   InAppWebViewController webView;
//   String url = "";
//   double progress = 0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   var _url;
//   var _title;
//   final _key = UniqueKey();
//   _WebViewContainerState(this._url, this._title);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(_title),
//         ),
//         body: Container(
//             child: Column(children: <Widget>[
//           Container(
//               padding: EdgeInsets.all(10.0),
//               child: progress < 1.0
//                   ? LinearProgressIndicator(value: progress)
//                   : Container()),
//           Expanded(
//             child: Container(
//               margin: const EdgeInsets.all(10.0),
//               decoration:
//                   BoxDecoration(border: Border.all(color: Colors.blueAccent)),
//               child: InAppWebView(
//                 key: _key,
//                 initialUrl: _url,
//                 initialHeaders: {},
//                 initialOptions: InAppWebViewGroupOptions(
//                     crossPlatform: InAppWebViewOptions(
//                   debuggingEnabled: true,
//                 )),
//                 onWebViewCreated: (InAppWebViewController controller) {
//                   webView = controller;
//                 },
//                 onLoadStart: (InAppWebViewController controller, String url) {
//                   setState(() {
//                     this.url = url;
//                   });
//                 },
//                 onLoadStop:
//                     (InAppWebViewController controller, String url) async {
//                   setState(() {
//                     this.url = url;
//                   });
//                 },
//                 onProgressChanged:
//                     (InAppWebViewController controller, int progress) {
//                   setState(() {
//                     this.progress = progress / 100;
//                   });
//                 },
//               ),
//             ),
//           ),
//           ButtonBar(
//             alignment: MainAxisAlignment.center,
//             children: <Widget>[
//               RaisedButton(
//                 child: Icon(Icons.arrow_back),
//                 onPressed: () {
//                   if (webView != null) {
//                     webView.goBack();
//                   }
//                 },
//               ),
//               RaisedButton(
//                 child: Icon(Icons.arrow_forward),
//                 onPressed: () {
//                   if (webView != null) {
//                     webView.goForward();
//                   }
//                 },
//               ),
//               RaisedButton(
//                 child: Icon(Icons.refresh),
//                 onPressed: () {
//                   if (webView != null) {
//                     webView.reload();
//                   }
//                 },
//               ),
//             ],
//           ),
//         ])),
//       ),
//     );
//   }
// }
