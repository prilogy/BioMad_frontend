import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final double height;
  final Widget? prepend;
  final Widget? append;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget? divider;
  final EdgeInsetsGeometry tilePadding;
  final VoidCallback? onTap;

  static const double baseHeight = 60;

  CustomListTile(
      {this.height = baseHeight,
      this.prepend,
      this.append,
      this.onTap,
      this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.divider,
      this.tilePadding = const EdgeInsets.symmetric(
          vertical: Indents.sm, horizontal: Indents.md)});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap?.call();
          },
          child: Container(
            padding: tilePadding,
            height: height,
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: [prepend ?? Container(), append ?? Container()],
            ),
          ),
        ),
      ),
      divider ?? Container()
    ]);
  }
}
