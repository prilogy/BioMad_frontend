import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

Widget biomarkerItems(BuildContext context, Biomarker data) {
  bool isAdded;
  try {
    store.state.memberBiomarkerModelList.biomarkers
        ?.firstWhere((element) => element.biomarkerId == data.id, orElse: null);
    isAdded = true;
  } catch (e) {
    isAdded = false;
  }
  return isAdded
      ? GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            SnackBarExtension.dark("Нельзя выбрать уже добавленный биомаркер!", duration: Duration(seconds: 4));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: Indents.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.content.name.length > 44
                      ? data.content.name.substring(0, 44) + "..."
                      : data.content.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .merge(TextStyle(color: BioMadColors.base[300])),
                ),
              ],
            ),
          ))
      : GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.of(context).pop(data);
            //dataList.firstWhere((element) => element.id == data.id)
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: Indents.sm),
            child: Text(
              data.content.name.length > 44
                  ? data.content.name.substring(0, 44) + "..."
                  : data.content.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .merge(TextStyle(color: BioMadColors.base[500])),
            ),
          ));
}
