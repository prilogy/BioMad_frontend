import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

import 'biomarker_alert.dart';
import '../drop_text.dart';

// ignore: must_be_immutable
class BiomarkerInfo extends StatelessWidget {
  final Biomarker biomarker;
  final String title;

  BiomarkerInfo({
    this.biomarker,
    this.title,
  });

  BiomarkerInfo.forScrollingViews({
    this.biomarker,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(bottom: Indents.sm),
        child: Text(
          "Информация",
          style: theme.textTheme.headline6
              .merge(TextStyle(color: theme.primaryColor)),
        ),
      ),
      Text(
        biomarker.content.description ?? "Описание к маркеру не добавлено :(",
        style: theme.textTheme.bodyText2,
      ),
      Container(
          padding: EdgeInsets.only(top: Indents.md),
          margin: EdgeInsets.only(bottom: Indents.sm),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: Indents.sm),
                    child: Text("Чем опасен",
                        style: theme.textTheme.subtitle1
                            .merge(TextStyle(color: theme.primaryColor)))),
                DropText(
                    header: "Пониженный показатель",
                    inside:
                        "При пониженном показателе происходит так называемый разнообразный и богатый опыт новая модель организационной деятельности представляет собой интересный эксперимент проверки систем массового участия. Товарищи! дальнейшее развитие различных форм деятельности способствует подготовки и реализации форм развития.",
                    color: theme.colorScheme.onBackground),
                DropText(
                    header: "Повышенный показатель",
                    inside:
                        "При повышенном показателе происходит так называемый разнообразный и богатый опыт новая модель организационной деятельности представляет собой интересный эксперимент проверки систем массового участия. Товарищи! дальнейшее развитие различных форм деятельности способствует подготовки и реализации форм развития.",
                    color: theme.errorColor),
              ])),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              Keys.rootNavigator.currentState.pushReplacementNamed(Routes.main);
            },
            child: Text('ПОВЫСИТЬ',
                style: theme.textTheme.bodyText2
                    .merge(TextStyle(color: theme.colorScheme.onPrimary))),
            color: theme.errorColor,
          ),
          RaisedButton(
            onPressed: () {
              Keys.rootNavigator.currentState.pushReplacementNamed(Routes.main);
            },
            child: Text('ПОНИЗИТЬ',
                style: theme.textTheme.bodyText2
                    .merge(TextStyle(color: theme.colorScheme.onPrimary))),
            color: BioMadColors.success,
          ),
          RaisedButton(
            color: theme.primaryColor,
            child: Icon(
              Icons.share,
              color: theme.colorScheme.background,
            ),
            onPressed: () {
              Keys.rootNavigator.currentState
                  .pushReplacementNamed(Routes.add_analysis);
            },
          ),
        ],
      )
    ]);
  }
}
