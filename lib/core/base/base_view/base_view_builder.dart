import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final T? viewModel;
  final void Function(T? viewModel)? onInit;
  final void Function(T? viewModel)? onDispose;
  final Widget Function(BuildContext context, T? viewModel)? pageBuilder;

  const BaseView({
    super.key,
    this.viewModel,
    this.onInit,
    this.onDispose,
    this.pageBuilder,
  });

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T> extends State<BaseView<T>> {
  @override
  void initState() {
    super.initState();
    if (widget.onInit != null) {
      widget.onInit!(widget.viewModel);
    }
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!(widget.viewModel);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.pageBuilder!(context, widget.viewModel);
  }
}
