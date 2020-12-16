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
import 'drop_text.dart';

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

  Widget historyItem(context, int index, MemberBiomarker data) {
    final theme = Theme.of(context);

    var color;
    var status;
    var icon;
    var reference = store.state.biomarkerList.biomarkers
        .firstWhere((element) => element.id == data.biomarkerId)
        .reference;

    if (reference.valueA <= data.value && data.value <= reference.valueB) {
      color = BioMadColors.success;
      status = "норма";
    } else if (data.value < reference.valueA) {
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

    String zeroAdding(int value) {
      return value > 10 ? value.toString() : "0" + value.toString();
    }

    return Container(
      padding: EdgeInsets.only(top: Indents.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data.dateCreatedAt.day.toString() +
                '.' +
                zeroAdding(data.dateCreatedAt.month) +
                '.' +
                data.dateCreatedAt.year.toString() +
                ' ' +
                data.dateCreatedAt.hour.toString() +
                ':' +
                zeroAdding(data.dateCreatedAt.minute),
            style: theme.textTheme.bodyText1,
          ),
          Row(
            children: [
              Container(
                  padding: status == "норма"
                      ? EdgeInsets.only(right: Indents.sm)
                      : null,
                  child: icon != null
                      ? Icon(icon, color: color, size: 18.0)
                      : iconContainer),
              Text(
                data.value.toString() +
                    " " +
                    data.unit.content.shorthand +
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
