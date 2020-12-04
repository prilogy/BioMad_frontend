import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

import 'biomarker_alert.dart';

class BiomarkerHistory extends StatelessWidget with IndentsMixin {
  final Widget child;
  final int id;
  final MemberBiomarker biomarker;
  final String name;
  final double value;
  final String unit;
  final String status;
  final TextStyle headerMergeStyle;
  final CrossAxisAlignment crossAxisAlignment;
  final bool withActions;
  final List<MemberBiomarker> biomarkerHistory;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry headerPadding;

  static const EdgeInsetsGeometry _defaultMargin =
      const EdgeInsets.only(bottom: Indents.md);

  BiomarkerHistory(
      {this.child,
      this.id,
      this.biomarker,
      this.name = "",
      this.value,
      this.biomarkerHistory,
      this.unit = "",
      this.status = "",
      this.headerMergeStyle,
      this.headerPadding = const EdgeInsets.all(0),
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.padding = const EdgeInsets.symmetric(horizontal: Indents.md),
      this.withActions = true,
      this.margin = _defaultMargin});

  BiomarkerHistory.forScrollingViews(
      {this.child,
      this.id,
      this.biomarker,
      this.name,
      this.value,
      this.biomarkerHistory,
      this.unit,
      this.status,
      this.withActions,
      this.headerMergeStyle,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.headerPadding = const EdgeInsets.only(left: Indents.md),
      this.padding = const EdgeInsets.all(0),
      this.margin = _defaultMargin});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 23 * biomarkerHistory.length.toDouble() <= 90
          ? 23 * biomarkerHistory.length.toDouble()
          : 90,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: biomarkerHistory.length,
          itemBuilder: (context, index) => historyItem(context, index)),
    );
  }

  Widget historyItem(context, int index) {
    final theme = Theme.of(context);

    var color;
    var status;
    var icon;
    var reference = store.state.biomarkerList.biomarkers
        .firstWhere((element) => element.id ==  biomarkerHistory[index].biomarkerId)
        .references;

    if (reference.valueA <=  biomarkerHistory[index].value &&
        biomarkerHistory[index].value <= reference.valueB) {
      color = BioMadColors.success;
      status = "норма";
    } else if ( biomarkerHistory[index].value < reference.valueA) {
      color = BioMadColors.warning;
      status = "пониженный";
      icon = Icons.keyboard_arrow_down;
    } else {
      color = BioMadColors.warning;
      status = "повышенный";
      icon = Icons.keyboard_arrow_up;
    }

    var iconContainer = Container(
        height: 6.0,
        width: 6.0,
        decoration: new BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ));

    return Container(
      padding: EdgeInsets.only(top: Indents.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            biomarkerHistory[index].dateCreatedAt.day.toString() +
                '.' +
                biomarkerHistory[index].dateCreatedAt.month.toString() +
                '.' +
                biomarkerHistory[index].dateCreatedAt.year.toString() +
                ' ' +
                biomarkerHistory[index].dateCreatedAt.hour.toString() +
                ':' +
                biomarkerHistory[index].dateCreatedAt.minute.toString(),
            style: theme.textTheme.bodyText1,
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(right: Indents.sm),
                  child:
                      icon != null ? Icon(icon, color: color, size: 17.0) : iconContainer),
              Text(
                biomarkerHistory[index].biomarker.content.name +
                    " " +
                    biomarkerHistory[index].value.toString() +
                    " " +
                    biomarkerHistory[index].unit.content.shorthand +
                    ", " +
                    status,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
