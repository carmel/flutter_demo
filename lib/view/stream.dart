import 'dart:async';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/common.dart';

class StreamAdd extends StatefulWidget {
  StreamController<String> _sc;
  StreamAdd(this._sc);
  @override
  _StreamAddState createState() => _StreamAddState();
}

class _StreamAddState extends State<StreamAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
            builder: (ctx) => Center(
                child: RaisedButton(
                    child: const Text('测试SnackBar'),
                    color: Colors.blue,
                    onPressed: () => Scaffold.of(ctx).showSnackBar(SnackBar(
      content: Text('SnackBar消息', textAlign: TextAlign.center),
      backgroundColor: Colors.red,
    ))))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget._sc.sink.add(WordPair.random().asPascalCase);
          },
          tooltip: '添加数据',
          child: Icon(Icons.add),
        ));
  }
}

class StreamPage extends StatefulWidget {
  final StreamController<String> _sc = StreamController<String>();

  @override
  _TestAddState createState() => _TestAddState();
}

class _TestAddState extends State<StreamPage> {
  final StreamController<String> _sc = StreamController<String>();
  @override
  Widget build(BuildContext context) {
    return CommonPage(
        name: 'Stream实现状态更新',
        tap: <Widget>[
          IconButton(
              icon: const Icon(Icons.arrow_forward),
              disabledColor: Colors.grey,
              color: Colors.white,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => StreamAdd(_sc))))
        ],
        sc: _sc);
  }

  @override
  void dispose() {
    _sc.close();
    super.dispose();
  }
}
