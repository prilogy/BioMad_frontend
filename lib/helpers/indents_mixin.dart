import 'package:flutter/material.dart';

mixin IndentsMixin {
  EdgeInsetsGeometry get padding;
  EdgeInsetsGeometry get margin;

  Widget withIndents({Widget child, bool ignorePadding=false, bool ignoreMargin=false}) {
    return Container(
      padding: !ignorePadding ? padding : null,
      margin: !ignoreMargin ? margin : null,
      child: child,
    );
  }
}