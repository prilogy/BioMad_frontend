import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/get_state.dart';
import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/member_biomarker_list.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/biomarker_screen.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'biomarker/biomarker_alert.dart';
import 'on_load_container.dart';

class CategoryItem extends StatelessWidget {
  final int? index;
  final Category? category;
  final List<MemberBiomarker>? memberBiomarkers;
  final List<Biomarker>? biomarkers;


  CategoryItem({this.index, this.category, this.memberBiomarkers, this.biomarkers});

  CategoryItem.forScrollingViews({this.index, this.category, this.memberBiomarkers, this.biomarkers});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var color;
    var status;
    double state;
    int allBiomarkers;
    int successfulBiomarkers;

    try {
      allBiomarkers = 0;
      successfulBiomarkers = 0;

      for (var item in memberBiomarkers!) {
        if (category!.biomarkerIds!.contains(item.biomarkerId)) {
          allBiomarkers++;
          Biomarker biomarkerItem = biomarkers!.firstWhere((element) => element.id == item.biomarkerId);
          if (biomarkerItem.state == BiomarkerStateType.number2_) successfulBiomarkers++;
        }
      }
      state = allBiomarkers != 0 && successfulBiomarkers != 0
          ? successfulBiomarkers / allBiomarkers * 100
          : allBiomarkers != 0
              ? 0.1
              : 0;
    } catch (e) {
      print("CATEGORY ITEM: " + e.toString());
      state = -1;
    }
    if (state >= 80.0) {
      color = BioMadColors.success;
      status = tr('state.excellent');
    } else if (state >= 40.0) {
      color = BioMadColors.warning;
      status = tr('state.satisfactory');
    } else if (state > 0.0 && state < 40.0) {
      color = BioMadColors.error;
      status = tr('state.terrible');
    } else {
      color = BioMadColors.base[400];
      status = tr('state.undefined');
    }

    return GestureDetector(
      onTap: () {
        Keys.rootNavigator.currentState!.pushReplacementNamed(Routes.category_analysis, arguments: category);
      },
      child: Container(
        padding: EdgeInsets.only(left: Indents.md, right: Indents.sm),
        margin: EdgeInsets.only(top: index == 0 ? Indents.md : Indents.smd, left: Indents.md, right: Indents.md),
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
              Icon(
                Icons.favorite,
                color: color,
                size: 32.0,
              ),
              Container(
                padding: EdgeInsets.all(Indents.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category!.content!.name!,
                      style: theme.textTheme.bodyText2,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        tr('category.state') + ": " + status,
                        style: theme.textTheme.caption!.merge(TextStyle(color: color)),
                      ),
                    )
                  ],
                ),
              )
            ]),
            IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: BioMadColors.primary,
                  size: 24.0,
                ),
                onPressed: null)
          ],
        ),
      ),
    );
  }
}
