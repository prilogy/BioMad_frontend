import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/home_screen.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom_button.dart';
import 'package:biomad_frontend/widgets/drop_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BiomarkerContainer extends StatefulWidget {
  final int id;
  final MemberBiomarker biomarker;

  BiomarkerContainer({Key key, this.id, this.biomarker}) : super(key: key);

  @override
  _BiomarkerContainerState createState() =>
      _BiomarkerContainerState(id, biomarker);
}

class _BiomarkerContainerState extends State<BiomarkerContainer> {
  final int id;
  final MemberBiomarker biomarker;

  _BiomarkerContainerState(this.id, this.biomarker);

  List<MemberBiomarker> biomarkerHistory = [];

  List<Biomarker> _biomarker;

  Future<List<Biomarker>> getBiomarkers() async {
    return await api.biomarker.info();
  }

  @override
  void initState() {
    setState(() {
      for (var item in store.state.memberBiomarkerList.biomarkers)
        if (item.biomarker.id == biomarker.biomarkerId)
          biomarkerHistory.add(item);
    });

    getBiomarkers().then((x) => {
          setState(() {
            _biomarker = x;
            print (_biomarker);
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                      "<st> " +
                          biomarker.biomarker.content.name +
                          " " +
                          biomarker.value.toString() +
                          ", <textDesc>",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: Indents.sm),
                    child: Text(
                      "История",
                      style: theme.textTheme.headline6
                          .merge(TextStyle(color: theme.primaryColor)),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: FlatButton(
                      color: Colors.transparent,
                      splashColor: Colors.black26,
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      child: Text(
                        'показать всю'.toUpperCase(),
                        style: theme.textTheme.bodyText1
                            .merge(TextStyle(color: theme.primaryColor)),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 23 * biomarkerHistory.length.toDouble() <= 90
                    ? 23 * biomarkerHistory.length.toDouble()
                    : 90,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: biomarkerHistory.length,
                    itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.only(top: Indents.sm),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                biomarkerHistory[index]
                                        .dateCreatedAt
                                        .day
                                        .toString() +
                                    '.' +
                                    biomarkerHistory[index]
                                        .dateCreatedAt
                                        .month
                                        .toString() +
                                    '.' +
                                    biomarkerHistory[index]
                                        .dateCreatedAt
                                        .year
                                        .toString() +
                                    ' ' +
                                    biomarkerHistory[index]
                                        .dateCreatedAt
                                        .hour
                                        .toString() +
                                    ':' +
                                    biomarkerHistory[index]
                                        .dateCreatedAt
                                        .minute
                                        .toString(),
                                style: theme.textTheme.bodyText1,
                              ),
                              Text(
                                "<st> " +
                                    biomarkerHistory[index].value.toString() +
                                    " " +
                                    biomarkerHistory[index].unit.content.name +
                                    ", <textDesc>",
                              ),
                            ],
                          ),
                        )),
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
                store.state.biomarkerList.biomarkers[1].toString(),
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
