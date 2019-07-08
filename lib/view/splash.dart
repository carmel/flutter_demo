import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/base.dart';
import 'package:flutter_demo/widget/scofold.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<SplashPage> {
  final List<MenuCard> _cards = <MenuCard>[
    MenuCard(
        title: 'Toast',
        path: 'toast',
        color: Base.PrimaryColor(1),
        icon: Icons.toys),
      MenuCard(
        title: '状态更新',
        path: 'stream',
        color: Base.PrimaryColor(1),
        icon: Icons.accessibility_new)
  ];
  Timer _t;

  @override
  void initState() {
    super.initState();
    _t = new Timer(const Duration(milliseconds: 2500), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder<Null>(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: StatelessScaffold(
                        title: 'Flutter实践用例',
                        align: Alignment.topCenter,
                        body: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(8.0),
                            mainAxisSpacing: 3.0, //竖向间距
                            crossAxisCount: 4, //横向Item的个数
                            crossAxisSpacing: 3.0, //横向间距
                            children: this._cards),
                      ),
                    );
                  },
                );
              },
              transitionDuration: Duration(milliseconds: 1500),
            ),
            (Route route) => route == null);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          alignment: Alignment(0, -0.7),
          child: Image.asset("asset/image/splash.jpeg",
              colorBlendMode: BlendMode.colorDodge,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity)),
    );
  }
}
