import 'dart:async';

import 'package:flutter/material.dart';

class ToastView {
  static final ToastView _singleton = ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();

  static OverlayState _overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void show(
      {@required BuildContext context,
      @required IconData icon,
      double radius = 5,
      double bottom = 45,
      String msg,
      int duration = 2,
      Color backgroundColor = const Color.fromRGBO(54, 54, 54, 0.8),
      Color color = const Color(0xFFFFFFFF)}) async {
    _dismiss();
    _overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = backgroundColor;

    Completer<VoidCallback> result = Completer<VoidCallback>();

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
          // top: top,
          bottom: bottom,
          child: Material(
            color: Colors.transparent,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      constraints: BoxConstraints(minHeight: 24.0),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(radius),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 4,
                        runSpacing: 2,
                        children: <Widget>[
                          IconTheme(
                              data: IconThemeData(color: color, size: 15.0),
                              child: Icon(icon)),
                          Text(msg ?? '',
                              softWrap: true,
                              style: TextStyle(fontSize: 15, color: color))
                        ],
                      ),
                    ))),
          )),
    );
    _isVisible = true;
    _overlayState.insert(_overlayEntry);
    result.future.then((fn) => fn());
    Future.delayed(Duration(seconds: duration), () {
      result.complete(() => _dismiss());
    });
  }

  static _dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}
