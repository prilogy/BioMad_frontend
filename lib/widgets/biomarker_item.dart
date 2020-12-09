import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/biomarker_screen.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

import 'biomarker_alert.dart';

class BiomarkerItem extends StatelessWidget with IndentsMixin {
  final Widget child;
  final int id;
  final double value;
  final String unit;
  final bool isModel;
  final TextStyle headerMergeStyle;
  final CrossAxisAlignment crossAxisAlignment;
  final bool withActions;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry headerPadding;

  static const EdgeInsetsGeometry _defaultMargin =
      const EdgeInsets.only(bottom: Indents.md);

  BiomarkerItem(
      {this.child,
      this.id,
      this.value,
      this.unit = "",
      this.isModel = false,
      this.headerMergeStyle,
      this.headerPadding = const EdgeInsets.all(0),
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.padding = const EdgeInsets.symmetric(horizontal: Indents.md),
      this.withActions = true,
      this.margin = _defaultMargin});

  BiomarkerItem.forScrollingViews(
      {this.child,
      this.id,
      this.value,
      this.unit,
      this.isModel,
      this.withActions,
      this.headerMergeStyle,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.headerPadding = const EdgeInsets.only(left: Indents.md),
      this.padding = const EdgeInsets.all(0),
      this.margin = _defaultMargin});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    String status;
    var color;
    var icon;
    var reference = store.state.biomarkerList.biomarkers
        .firstWhere((element) => element.id == id)
        .reference;

    if (reference.valueA <= value && value <= reference.valueB) {
      color = BioMadColors.success;
      status = "норма";
    } else if (value < reference.valueA) {
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
        margin: EdgeInsets.only(right: Indents.sm),
        decoration: new BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ));

    MemberBiomarkerModel _biomarkerModel;
    Biomarker biomarker;
    if (isModel)
      _biomarkerModel = store.state.memberBiomarkerModelList.biomarkers
          .firstWhere((element) => element.biomarkerId == id);
    else
      biomarker = store.state.biomarkerList.biomarkers
          .firstWhere((element) => element.id == id);

    return GestureDetector(
      onTap: () {
        return withActions
            ? null
            : showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BioMarkerScreen(biomarkerId: id);
                });
      },
      child: Container(
        margin: EdgeInsets.only(
          top: Indents.smd,
        ),
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
              Container(
                padding: EdgeInsets.all(Indents.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      biomarker.content.name,
                      style: theme.textTheme.subtitle1,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  child: icon != null
                                      ? Icon(icon, color: color, size: 22.0)
                                      : iconContainer),
                              Text(
                                  value.toString() + ' ' + unit + ', ' + status,
                                  style: Theme.of(context).textTheme.bodyText2),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
            withActions
                ? Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: BioMadColors.primary,
                          size: 24.0,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return BiomarkerAlertDialog(
                                context,
                                biomarker: _biomarkerModel,
                                title: "Изменить биомаркер",
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Отмена'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Изменить'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                                //contentHeight: h,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: Indents.md),
                              );
                            },
                          );
                        },
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.close,
                            color: BioMadColors.error,
                            size: 24.0,
                          ),
                          onPressed: null)
                    ],
                  )
                : IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: BioMadColors.primary,
                      size: 24.0,
                    ),
                    onPressed: () {
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return BioMarkerScreen(biomarkerId: id);
                          });
                    }),
          ],
        ),
      ),
    );
  }
}
