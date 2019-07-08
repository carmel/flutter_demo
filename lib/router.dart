import 'package:flutter/material.dart';
import 'package:flutter_demo/view/splash.dart';
import 'package:flutter_demo/view/stream.dart';
import 'package:flutter_demo/view/toast.dart';

class Router {
  final Map<String, WidgetBuilder> getRouter = {
    '/': (_) => SplashPage(),
    'toast': (_) => ToastPage(),
    'stream': (_) => StreamPage(),
  };
}