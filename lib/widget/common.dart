import 'dart:async';

import 'package:flutter/material.dart';

class CommonPage extends StatefulWidget {
  final String name;
  final List<Widget> tap;
  final StreamController<String> sc;

  CommonPage({this.name, this.tap, this.sc});
  @override
  _CommonState createState() => _CommonState();
}

class _CommonState extends State<CommonPage> {
  List data = [];

  @override
  void initState() {
    super.initState();
    widget.sc.stream.listen((dat) {
      setState(() {
        data.insert(0, dat);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0.0,
            centerTitle: true,
            automaticallyImplyLeading: true,
            title: Text(widget.name,
                style: TextStyle(
                    fontSize: 18.0, color: Color.fromRGBO(227, 242, 227, 1.0))),
            actions: widget.tap,
          ),
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07)),
      body: Center(
        child: ListView.builder(
          itemCount: data?.length ?? 0,
          itemBuilder: (context, item) {
            return Container(
              child: Column(
                children: <Widget>[Text(data[item] ?? '没有数据'), Divider()],
              ),
            );
          },
        ),
      ),
    );
  }
}
