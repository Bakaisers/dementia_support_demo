import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class EasyWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
// Gonna try implementing easy_web_view
// static html.IFrameElement _iFrameElement = html.IFrameElement();

// void _setup(String src, num width, num height){
//   final src = widget.src;
//   ui.platfromViewRegistry.registerViewFactory('iframe-$src', (int viewId){
//     final element = _iFrameElement
//     ..style.border = '0'
//     ..allowFullscreen = widget.webAllowFullScreen
//     ..height = height.toInt().toString()
//     ..width = width.toInt().toString();
//     if (src != null) {
//         String _src = src;
//         if (widget.isMarkdown) {
//           _src = "data:text/html;charset=utf-8," +
//               Uri.encodeComponent(EasyWebViewImpl.md2Html(src));
//         }
//         if (widget.isHtml) {
//           _src = "data:text/html;charset=utf-8," +
//               Uri.encodeComponent(EasyWebViewImpl.wrapHtml(src));
//         }
//         element..src = _src;
//       }
//       return element;
//   });
// }
