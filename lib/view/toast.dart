import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/base.dart';
import 'package:flutter_demo/util/toast.new.dart';
import 'package:flutter_demo/widget/scofold.dart';

class ToastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatelessScaffold(
        title: '吐司',
        align: Alignment.topCenter,
        body: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: <Widget>[
                Base.FullSizeButton(
                    context, '成功提示', () => Toast.of(context).Success('操作成功')),
                Base.FullSizeButton(
                    context,
                    '错误提示',
                    () => Toast.of(context).Error(
                        '网络连接失败网络连接失败网络连接失败网络连接失败网络连接失败网络连接失败网络连接失败sdfsadfsafdsafsadfdsafasdfdsafa')),
                Base.FullSizeButton(
                    context, '一般提示', () => Toast.of(context).Info('提示信息')),
                Base.FullSizeButton(
                    context, '警告', () => Toast.of(context).Warn('警告啦'))
              ],
            )));
  }
}
