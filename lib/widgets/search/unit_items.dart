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

Widget unitItems(BuildContext context, data) {
  return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context)
            .pop(data);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Indents.sm),
        child: Text(
          data.content.name,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .merge(TextStyle(color: BioMadColors.base[500], fontWeight: FontWeight.normal)),
        ),
      ));
}