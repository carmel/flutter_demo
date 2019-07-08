import 'package:flutter/material.dart';

class Base {
  
  static Color PrimaryColor(double opacity) {
    return Color.fromRGBO(0, 209, 178, opacity);
  }

  static Color DangerColor(double opacity) {
    return Color.fromRGBO(245, 108, 108, opacity);
  }

  static Color SuccessColor(double opacity) {
    return Color.fromRGBO(35, 209, 96, opacity);
  }

  static Color InfoColor(double opacity) {
    return Color.fromRGBO(32, 156, 238, opacity);
  }

  static Color WarningColor(double opacity) {
    return Color.fromRGBO(255, 221, 87, opacity);
  }

  static Color LightColor(double opa) {
    return Color.fromRGBO(245, 245, 245, opa);
  }

  static Color DarkColor(double opa) {
    return Color.fromRGBO(54, 54, 54, opa);
  }

  static Widget getHeader(BuildContext ctx, String name, bool hidden) {
    return PreferredSize(
        child: AppBar(
          elevation: 0.0,
          centerTitle: true,
          automaticallyImplyLeading: hidden,
          title: Text(name,
              style: TextStyle(
                  fontSize: 18.0, color: Color.fromRGBO(227, 242, 227, 1.0))),
        ),
        preferredSize: Size.fromHeight(MediaQuery.of(ctx).size.height * 0.07));
  }

  static FullSizeButton(BuildContext ctx, String text, Function tapEvent) {
    return Container(
        height: 44,
        width: MediaQuery.of(ctx).size.width,
        margin: EdgeInsets.only(top: 40),
        child: RaisedButton(
          onPressed: tapEvent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
            child: Text(text,
                style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
          color: InfoColor(1),
        ));
  }
}