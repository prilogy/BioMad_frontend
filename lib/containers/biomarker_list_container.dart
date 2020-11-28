import 'package:api/api.dart';
import 'package:biomad_frontend/containers/members_list_container.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/age_from_date.dart';
import 'package:biomad_frontend/helpers/color_helpers.dart';
import 'package:biomad_frontend/helpers/custom_alert_dialog.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/authorization.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/Gender/actions.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom_circle_avatar.dart';
import 'package:biomad_frontend/widgets/custom_list_builder.dart';
import 'package:biomad_frontend/widgets/custom_list_tile.dart';
import 'package:biomad_frontend/widgets/drop_text.dart';
import 'package:biomad_frontend/widgets/member_list_tile.dart';
import 'package:biomad_frontend/widgets/custom_divider.dart';
import 'package:biomad_frontend/widgets/social_account_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class BiomarkerContainer extends StatefulWidget {
  @override
  _BiomarkerContainerState createState() => _BiomarkerContainerState();
}

class _BiomarkerContainerState extends State<BiomarkerContainer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _tr = trWithKey('account_container');
    final user = store.state.user;
    final currentMember = store.state.authorization.currentMember;
    //TODO: Добавить локализацию

    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BlockBaseWidget(
            padding: EdgeInsets.only(
                top: Indents.md, left: Indents.md, right: Indents.md),
            margin: EdgeInsets.only(bottom: Indents.sm),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Ваш показатель",
                      style: theme.textTheme.bodyText1,
                    ),
                    Text(
                      "<st> <value> <unit>, <textDesc>",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Норма",
                      style: theme.textTheme.bodyText1,
                    ),
                    Text(
                      "<st> <value> <unit>",
                    ),
                  ],
                ),
              ],
            )),
        BlockBaseWidget(
            padding: EdgeInsets.only(
                top: Indents.md, left: Indents.md, right: Indents.md),
            margin: EdgeInsets.only(bottom: Indents.sm),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(bottom: Indents.sm),
                child: Text(
                  "История",
                  style: theme.textTheme.headline6
                      .merge(TextStyle(color: theme.primaryColor)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "biomarker.date",
                    style: theme.textTheme.bodyText1,
                  ),
                  Text(
                    "<st> <value> <unit>, <textDesc>",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "biomarker.date",
                    style: theme.textTheme.bodyText1,
                  ),
                  Text(
                    "<st> <value> <unit>, <textDesc>",
                  ),
                ],
              ),
            ])),
        BlockBaseWidget(
            padding: EdgeInsets.only(
                top: Indents.md, left: Indents.md, right: Indents.md),
            margin: EdgeInsets.only(bottom: Indents.sm),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(bottom: Indents.sm),
                child: Text(
                  "Информация",
                  style: theme.textTheme.headline6
                      .merge(TextStyle(color: theme.primaryColor)),
                ),
              ),
              Text(
                "Название маркера влияет очень сильно на ваш "
                "организм. Таким образом новая модель органи"
                "зационной деятельности влечет за собой процесс "
                "внедрения и модернизации дальнейших направлений... ",
                style: theme.textTheme.bodyText2,
              ),
              Container(
                  padding: EdgeInsets.only(top: Indents.md),
                  margin: EdgeInsets.only(bottom: Indents.sm),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: Indents.sm),
                            child: Text("Чем опасен",
                                style: theme.textTheme.subtitle1.merge(
                                    TextStyle(color: theme.primaryColor)))),
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
                      Keys.rootNavigator.currentState
                          .pushReplacementNamed(Routes.main);
                    },
                    child: Text('ПОВЫСИТЬ',
                        style: theme.textTheme.bodyText2.merge(
                            TextStyle(color: theme.colorScheme.onPrimary))),
                    color: theme.errorColor,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Keys.rootNavigator.currentState
                          .pushReplacementNamed(Routes.main);
                    },
                    child: Text('ПОНИЗИТЬ',
                        style: theme.textTheme.bodyText2.merge(
                            TextStyle(color: theme.colorScheme.onPrimary))),
                    color: BioMadColors.success,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Keys.rootNavigator.currentState
                          .pushReplacementNamed(Routes.main);
                    },
                    child: Text('ПОДЕЛИТЬСЯ',
                        style: theme.textTheme.bodyText2.merge(
                            TextStyle(color: theme.colorScheme.onPrimary))),
                    color: BioMadColors.primary,
                  ),
                ],
              )
            ])),
      ]),
    );
  }
}
