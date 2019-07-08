import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/base.dart';
import 'package:flutter_demo/plugin/toast.dart';

class Toast {
  BuildContext _ctx;
  Toast.of(BuildContext ctx) {
    this._ctx = ctx;
  }

  show(
      {@required Widget message,
      @required Widget icon,
      @required Color backgroudColor,
      bool inline = true,
      Color color = Colors.white,
      Duration delay = const Duration(seconds: 3),
      Alignment alignment = const Alignment(0.0, -0.2)}) {
    Completer<VoidCallback> result = Completer<VoidCallback>();
    Navigator.of(this._ctx, rootNavigator: true).push(WeToast(
        alignment: alignment,
        backgroudColor: backgroudColor,
        color: color,
        inline: inline,
        message: Builder(builder: (ctx) {
          Future.delayed(delay, () {
            result.complete(() => Navigator.pop(ctx));
          });
          return message;
        }),
        icon: icon));
    result.future.then((fn) => fn());
  }

  void Loading(String title) {
    show(inline: false,message: Text(title ?? ''), icon: _LoadingIcon(), backgroudColor: Base.DarkColor(0.8));
  }

  void Success(String title) {
    show(
        backgroudColor: Base.DarkColor(0.7),
        color: Base.SuccessColor(1),
        message: Text(title ?? ''),
        icon: Icon(Icons.cloud_done));
  }
  void Error(String title) {
    show(
        backgroudColor: Base.DarkColor(0.7),
        color: Base.DangerColor(1),
        message: Text(title ?? ''),
        icon: Icon(Icons.error));
  }

  void Info(String title) {
    show(
        backgroudColor: Base.DarkColor(0.7),
        message: Text(title ?? ''),
        icon: Icon(Icons.error_outline));
  }

  void Warn(String title) {
    show(
        backgroudColor: Base.DarkColor(0.7),
        color: Base.WarningColor(1),
        message: Text(title ?? ''),
        icon: Icon(Icons.warning));
  }
}

class _LoadingIcon extends StatefulWidget {
  final double size;

  _LoadingIcon({this.size = 50.0});

  @override
  _LoadingIconState createState() => _LoadingIconState();
}

class _LoadingIconState extends State<_LoadingIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _doubleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000))
      ..repeat();
    _doubleAnimation = Tween(begin: 0.0, end: 360.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: _doubleAnimation.value ~/ 30 * 30.0 * 0.0174533,
        child: Image.asset("asset/image/loading.png",
            width: widget.size, height: widget.size));
  }
}
