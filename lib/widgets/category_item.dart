import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/get_state.dart';
import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/member_biomarker_list.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/biomarker_screen.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

import 'biomarker_alert.dart';
import 'on_load_container.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final Category category;

  CategoryItem({this.index, this.category});

  CategoryItem.forScrollingViews({this.index, this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    MemberBiomarkerList memberBiomarkerList = store.state.memberBiomarkerList;

    bool flag = false;
    Future<double> state = getStateAsync(category, memberBiomarkerList, flag);

    var color;
    var status;

    return FutureBuilder(
      future: state,
      builder: (context, AsyncSnapshot<double> state) {
        if (state.hasData) {
          if (state.data > 80) {
            color = BioMadColors.success;
            status = "отличное";
          } else if (state.data > 40) {
            color = BioMadColors.warning;
            status = "удовлетворительное";
          } else if (state.data == 0.1) {
            color = color = BioMadColors.base[400];
            status = "не определено";
          } else {
            color = BioMadColors.error;
            status = "ужасное";
          }
          return GestureDetector(
            onTap: () {
              Keys.rootNavigator.currentState.pushReplacementNamed(
                  Routes.category_analysis,
                  arguments: category.id);
            },
            child: Container(
              padding: EdgeInsets.only(left: Indents.md, right: Indents.sm),
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
      },
    );
  }
}
