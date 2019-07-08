import 'package:flutter/material.dart';
import 'package:flutter_demo/base.dart';
import 'package:flutter_demo/plugin/toast.new.dart';

class Toast {
  BuildContext _ctx;
  Toast.of(BuildContext ctx) {
    this._ctx = ctx;
  }

  void Success(String title) {
    ToastView.show(context: _ctx, msg: title, icon: Icons.cloud_done,color: Base.SuccessColor(1));
  }
  void Error(String title) {
    ToastView.show(context: _ctx, msg: title, icon: Icons.error,color: Base.DangerColor(1));
  }

  void Info(String title) {
    ToastView.show(context: _ctx, msg: title, icon: Icons.error_outline);
  }

  void Warn(String title) {
    ToastView.show(context: _ctx, msg: title, icon: Icons.warning,color: Base.WarningColor(1));
  }
}
