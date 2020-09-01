import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiBaseView<T extends BaseModel, V extends ChangeNotifier>
    extends StatefulWidget {
  final Widget Function(BuildContext context, T model, V model2, Widget child)
      builder;
  final T model;
  final V model2;
  final Widget child;
  final Function(T) onModelReady;
  final Function(T) onModelDestroy;

  MultiBaseView(
      {this.builder,
      this.model,
      this.model2,
      this.child,
      this.onModelReady,
      this.onModelDestroy});

  @override
  _MultiBaseViewState<T, V> createState() => _MultiBaseViewState<T, V>();
}

class _MultiBaseViewState<T extends BaseModel, V extends ChangeNotifier>
    extends State<MultiBaseView<T, V>> {
  T model;
  V model2;

  @override
  void initState() {
    model = widget.model;
    model2 = widget.model2;
    if (widget.onModelReady != null) widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onModelDestroy != null) widget.onModelDestroy(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<T>(
          create: (_) => model,
        ),
        ChangeNotifierProvider<V>(
          create: (_) => model2,
        )
      ],
      child: Consumer2<T, V>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
