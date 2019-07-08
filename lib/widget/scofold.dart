import 'package:flutter/material.dart';
import 'package:flutter_demo/base.dart';


class TabScaffold extends StatelessWidget {
  final String name;
  final bool offstage;
  final Widget body;
  const TabScaffold({this.name, this.offstage, this.body});

  @override
  Widget build(BuildContext context) {
    return Offstage(
        offstage: this.offstage,
        child: Scaffold(
            appBar: Base.getHeader(context, this.name, false),
            body: this.body));
  }
}

class ListScaffold extends StatelessWidget {
  final String title;
  final List<ListTile> list;
  const ListScaffold({this.title, this.list, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatelessScaffold(
        title: this.title,
        align: Alignment.topCenter,
        body: ListView.builder(
          itemCount: this.list.length,
          itemBuilder: (context, item) {
            return Container(
              child: Column(
                children: <Widget>[this.list[item], Divider()],
              ),
            );
          },
        ));
    ;
  }
}

class StatelessScaffoldWithTapBar extends StatelessWidget {
  final String name;
  final Widget body;
  final List<Widget> tap;
  const StatelessScaffoldWithTapBar({this.name, this.body, this.tap, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              elevation: 0.0,
              centerTitle: true,
              automaticallyImplyLeading: true,
              title: Text(this.name,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color.fromRGBO(227, 242, 227, 1.0))),
              actions: this.tap,
            ),
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.07)),
        resizeToAvoidBottomPadding: false,
        body: this.body);
  }
}

class StatelessScaffoldWithBottomBar extends StatelessWidget {
  final String name;
  final Widget body;
  final Widget bottomBar;
  const StatelessScaffoldWithBottomBar({this.name, this.body, this.bottomBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Base.getHeader(context, this.name, true),
        resizeToAvoidBottomPadding: false,
        body: Center(child: this.body),
        bottomNavigationBar: bottomBar);
  }
}

class StatelessScaffold extends StatelessWidget {
  final String title;
  final AlignmentGeometry align;
  final Widget body;

  const StatelessScaffold({this.title, this.align, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Base.getHeader(context, this.title, true),
        resizeToAvoidBottomPadding: false,
        body: Container(
          alignment: this.align,
          child: this.body));
  }
}

class MenuCard extends StatelessWidget {
  final String path;
  final IconData icon;
  final String title;
  final Color color;
  MenuCard({this.title, this.path, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        Navigator.of(context).pushNamed(this.path);
      },
      child: Card(
        borderOnForeground: true,
        color: Colors.white.withAlpha(1000),
        child: Column(
          //横轴起始测对齐
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 2,
                child: Icon(
                  this.icon,
                  color: this.color,
                  size: 40,
                  textDirection: TextDirection.ltr,
                )),
            Expanded(
                flex: 1,
                child: Text(
                  this.title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
