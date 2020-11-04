import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class BlockBaseWidget extends StatelessWidget with IndentsMixin {
  final Widget child;
  final String header;
  final CrossAxisAlignment crossAxisAlignment;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry headerPadding;

  static const EdgeInsetsGeometry _defaultMargin =
      const EdgeInsets.only(bottom: Indents.md);

  BlockBaseWidget(
      {this.child,
      this.header = "",
      this.headerPadding = const EdgeInsets.all(0),
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.padding = const EdgeInsets.symmetric(horizontal: Indents.md),
      this.margin = _defaultMargin});

  BlockBaseWidget.forScrollingViews(
      {this.child,
      this.header,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.headerPadding = const EdgeInsets.only(left: Indents.md),
      this.padding = const EdgeInsets.all(0),
      this.margin = _defaultMargin});

  @override
  Widget build(BuildContext context) {
    return withIndents(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          if (header != "")
            Container(
                alignment: Alignment.topLeft,
                padding: headerPadding,
                margin: EdgeInsets.only(bottom: Indents.smd),
                child:
                    Text(header, style: Theme.of(context).textTheme.headline6)),
          child
        ],
      ),
    );
  }
}
