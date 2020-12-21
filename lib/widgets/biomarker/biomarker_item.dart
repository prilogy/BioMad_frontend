import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/biomarker_screen.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

import '../on_load_container.dart';
import 'biomarker_alert.dart';

class BiomarkerItem extends StatelessWidget {
  final Widget child;
  final int id;
  final String biomarkerName;
  final int unitId;
  final double value;
  final String unit;
  final bool isModel;
  final int index;
  final bool withActions;
  final BiomarkerStateType biomarkerState;

  static const EdgeInsetsGeometry _defaultMargin = const EdgeInsets.only(bottom: Indents.md);

  BiomarkerItem({
    this.child,
    @required this.id,
    @required this.unitId,
    this.value,
    this.biomarkerName,
    this.unit = "",
    this.isModel = false,
    this.index,
    this.withActions = true,
    this.biomarkerState,
  });

  BiomarkerItem.forScrollingViews({
    this.child,
    @required this.id,
    @required this.unitId,
    this.value,
    this.biomarkerName,
    this.unit,
    this.isModel,
    this.index,
    this.withActions,
    this.biomarkerState,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    String status;
    var color;
    var icon;

    MemberBiomarkerModel _biomarkerModel;
    if (isModel)
      _biomarkerModel =
          store.state.memberBiomarkerModelList.biomarkers.firstWhere((element) => element.biomarkerId == id);

    var iconContainer;

    if (biomarkerState == BiomarkerStateType.number2_) {
      color = BioMadColors.success;
      status = "норма";
    } else if (biomarkerState == BiomarkerStateType.number1_) {
      color = BioMadColors.warning;
      status = "пониженный";
      icon = Icons.keyboard_arrow_down;
    } else if (biomarkerState == BiomarkerStateType.number0_) {
      color = BioMadColors.warning;
      status = "повышенный";
      icon = Icons.keyboard_arrow_up;
    } else {
      status = "не определено";
      color = BioMadColors.base[300].withOpacity(0.8);
      iconContainer = Container(
          margin: EdgeInsets.only(right: Indents.sm),
          height: 6.0,
          width: 6.0,
          decoration: new BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ));
    }

    var iconContainerNormal = Container(
        height: 6.0,
        width: 6.0,
        margin: EdgeInsets.only(right: Indents.sm),
        decoration: new BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ));

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
        // MARGIN
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
                      biomarkerName.length > 30
                          ? biomarkerName.substring(0, 30) + "..."
                          : biomarkerName,
                      style: theme.textTheme.subtitle2,
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
                                      ? Icon(icon, color: color, size: 16.0)
                                      : status != "норма"
                                          ? iconContainer
                                          : iconContainerNormal),
                              Text(value.toString() + ' ' + unit + ', ' + status,
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
                                contentPadding: EdgeInsets.symmetric(vertical: Indents.md),
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
                          onPressed: () {
                            store.state.memberBiomarkerModelList.biomarkers.removeAt(index);
                            store.dispatch(
                                StoreThunks.setMemberBiomarkerModels(store.state.memberBiomarkerModelList.biomarkers));
                          })
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
