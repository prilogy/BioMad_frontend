import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class OnLoadContainer extends StatelessWidget {
  final int index;
  final color;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  OnLoadContainer({this.index, this.color, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.only(left: Indents.md, right: Indents.sm),
      margin: margin ?? EdgeInsets.only(
          top: index == 0 ? Indents.md : Indents.smd,
          left: Indents.md,
          right: Indents.md),
      decoration: BoxDecoration(
        color: BioMadColors.base[100],
        borderRadius: BorderRadius.all(Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: BioMadColors.base.withOpacity(0.06),
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            onLoadContainerItem(
              color: color,
              height: 32.0,
              width: 32.0,
            ),
            Container(
              padding: EdgeInsets.all(Indents.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  onLoadContainerItem(
                    color: color,
                    height: 14.0,
                    width: 160.0,
                  ),
                  onLoadContainerItem(
                    margin: EdgeInsets.only(top: Indents.sm),
                    color: color,
                    height: 12.0,
                    width: 80.0,
                  )
                ],
              ),
            )
          ]),
          IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: BioMadColors.base[300].withOpacity(0.8),
                size: 24.0,
              ),
              onPressed: null)
        ],
      ),
    );
  }

  Widget onLoadContainerItem({double height, double width,
      EdgeInsetsGeometry padding, EdgeInsetsGeometry margin, color}) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? BioMadColors.base[200].withOpacity(0.8),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }
}
