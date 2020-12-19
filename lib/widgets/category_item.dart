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
import 'package:flutter/material.dart';

import 'biomarker/biomarker_alert.dart';
import 'on_load_container.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final Category category;

  CategoryItem({this.index, this.category});

  CategoryItem.forScrollingViews({this.index, this.category});

  Future<List<Biomarker>> getBiomarker() async {
    return await api.biomarker.info();
  }

  Future<List<MemberBiomarker>> getMemberBiomarker() async {
    return await api.memberBiomarker.info();
  }

  Future<List<Category>> getCategories() async {
    return await api.category.info();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Future<List<MemberBiomarker>> memberBiomarkers = getMemberBiomarker();

    var color;
    var status;
    double state;

    return FutureBuilder(
      future: memberBiomarkers,
      builder:
          (context, AsyncSnapshot<List<MemberBiomarker>> memberBiomarkers) {
        if (memberBiomarkers.hasData) {
          int allBiomarkers = 0;
          int successfulBiomarkers = 0;
          MemberBiomarker memberBiomarkerItem;
          Future<List<Biomarker>> biomarkers = getBiomarker();

          return FutureBuilder(
              future: biomarkers,
              builder: (context, AsyncSnapshot<List<Biomarker>> biomarkers) {
                if (biomarkers.hasData && memberBiomarkers.data.isNotEmpty) {
                  for (var id in category.biomarkerIds) {
                    memberBiomarkerItem = memberBiomarkers.data
                        .firstWhere((element) => element.biomarkerId == id);
                    if (memberBiomarkerItem != null) {
                      allBiomarkers++;
                      Biomarker biomarkerItem = biomarkers.data
                          .firstWhere((element) => element.id == id);
                      if (biomarkerItem?.state?.value == 2)
                        successfulBiomarkers += 1;
                    }
                  }
                  state = successfulBiomarkers != 0 && allBiomarkers != 0
                      ? successfulBiomarkers / allBiomarkers * 100
                      : 0;
                  if (state >= 80) {
                    color = BioMadColors.success;
                    status = "отличное";
                  } else if (state >= 40) {
                    color = BioMadColors.warning;
                    status = "удовлетворительное";
                  } else if (state > 0 && state < 40) {
                    color = BioMadColors.error;
                    status = "ужасное";
                  } else {
                    color = BioMadColors.base[400];
                    status = "не определено";
                  }

                  return GestureDetector(
                    onTap: () {
                      Keys.rootNavigator.currentState.pushReplacementNamed(
                          Routes.category_analysis,
                          arguments: category);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.only(left: Indents.md, right: Indents.sm),
                      margin: EdgeInsets.only(
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
                                    category.content.name,
                                    style: theme.textTheme.bodyText2,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 2),
                                    child: Text(
                                      "Состояние: " + status,
                                      style: theme.textTheme.caption
                                          .merge(TextStyle(color: color)),
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
                } else if (memberBiomarkers.data.isEmpty) {
                  color = BioMadColors.base[400];
                  status = "не определено";
                  return GestureDetector(
                    onTap: () {
                      Keys.rootNavigator.currentState.pushReplacementNamed(
                          Routes.category_analysis,
                          arguments: category.id);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.only(left: Indents.md, right: Indents.sm),
                      margin: EdgeInsets.only(
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
                                    category.content.name,
                                    style: theme.textTheme.bodyText2,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 2),
                                    child: Text(
                                      "Состояние: " + status,
                                      style: theme.textTheme.caption
                                          .merge(TextStyle(color: color)),
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
                } else {
                  return OnLoadContainer(index: index);
                }
              });
        } else {
          return OnLoadContainer(index: index);
        }
      },
    );
  }
}
