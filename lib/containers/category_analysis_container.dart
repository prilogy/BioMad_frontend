import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_item.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class CategoryAnalysisContainer extends StatefulWidget {
  final int categoryId;

  CategoryAnalysisContainer({Key key, @required this.categoryId})
      : super(key: key);

  @override
  _CategoryAnalysisContainerState createState() =>
      _CategoryAnalysisContainerState(categoryId);
}

class _CategoryAnalysisContainerState extends State<CategoryAnalysisContainer> {
  final int categoryId;

  _CategoryAnalysisContainerState(this.categoryId);

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

    int epochTime = 0;
    DateTime dateOfChanged;

    var color;
    String status;
    double state;

    String zeroAdding(int value) {
      return value > 10 ? value.toString() : "0" + value.toString();
    }

    Future<List<Category>> categories = getCategories();
    Category category;

    Future<List<MemberBiomarker>> memberBiomarkers = getMemberBiomarker();
    MemberBiomarker memberBiomarker;

    Future<List<Biomarker>> biomarkers = getBiomarker();
    List<MemberBiomarker> biomarkerStock = [];
    List<Biomarker> biomarkerNotInStock = [];

    return FutureBuilder(
        future: categories,
        builder: (context, AsyncSnapshot<List<Category>> categories) {
          if (categories.hasData) {
            category = categories.data
                .firstWhere((element) => element.id == categoryId);
            return FutureBuilder(
                future: memberBiomarkers,
                builder: (context,
                    AsyncSnapshot<List<MemberBiomarker>> memberBiomarkers) {
                  if (memberBiomarkers.hasData) {
                    int allBiomarkers = 0;
                    int successfulBiomarkers = 0;
                    return FutureBuilder(
                        future: biomarkers,
                        builder: (context,
                            AsyncSnapshot<List<Biomarker>> biomarkers) {
                          print(biomarkers.data);
                          if (biomarkers.hasData) {
                            //Выясняем сданные и не сданные биомаркеры
                            try {
                              for (var item in category.biomarkerIds) {
                                memberBiomarker = memberBiomarkers.data.firstWhere(
                                        (x) => x.biomarkerId == item,
                                    orElse: () => null);
                                memberBiomarker != null
                                    ? biomarkerStock.add(memberBiomarker)
                                    : biomarkerNotInStock.add(biomarkers.data
                                    .firstWhere((x) => x.id == item,
                                    orElse: () => null));
                              }
                            } catch (e) {
                              biomarkerStock = [];
                              for (var item in category.biomarkerIds) {
                                biomarkerNotInStock.add(biomarkers.data
                                    .firstWhere((x) => x.id == item,
                                    orElse: () => null));
                              }
                            }
                            biomarkerStock.removeWhere((value) => value == null);
                            biomarkerNotInStock.removeWhere((value) => value == null);

                            //Выясняем сосотояние категории
                            for (var id in category.biomarkerIds) {
                              memberBiomarker = memberBiomarkers.data
                                  .firstWhere(
                                      (element) => element.biomarkerId == id);
                              if (memberBiomarker != null) {
                                allBiomarkers++;
                                Biomarker biomarkerItem = biomarkers.data
                                    .firstWhere((element) => element.id == id);
                                if (biomarkerItem?.state?.value == 2)
                                  successfulBiomarkers += 1;
                              }
                            }
                            state =
                                successfulBiomarkers != 0 && allBiomarkers != 0
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

                            return Container(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  BlockBaseWidget(
                                      padding: EdgeInsets.only(
                                          top: Indents.md,
                                          left: Indents.md,
                                          right: Indents.md),
                                      margin:
                                          EdgeInsets.only(bottom: Indents.sm),
                                      header: "Общее состояние",
                                      headerMergeStyle:
                                          TextStyle(color: theme.primaryColor),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(state.round().toString() + "%",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3
                                                    .merge(TextStyle(
                                                        color: color))),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: Indents.sm),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(status,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Row(
                                                    children: [
                                                      Text(
                                                          dateOfChanged != null
                                                              ? "Обновлено: " +
                                                                  dateOfChanged
                                                                      .day
                                                                      .toString() +
                                                                  '.' +
                                                                  zeroAdding(
                                                                      dateOfChanged
                                                                          .month) +
                                                                  '.' +
                                                                  dateOfChanged
                                                                      .year
                                                                      .toString() +
                                                                  ' в ' +
                                                                  dateOfChanged
                                                                      .hour
                                                                      .toString() +
                                                                  ':' +
                                                                  zeroAdding(
                                                                      dateOfChanged
                                                                          .minute)
                                                              : "Анализы не загружены",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText2),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ])),
                                  memberBiomarker != null
                                      ? BlockBaseWidget(
                                          padding: EdgeInsets.only(
                                              top: Indents.md,
                                              left: Indents.md,
                                              right: Indents.md),
                                          margin: EdgeInsets.only(
                                              bottom: Indents.sm),
                                          header: "Последние биомаркеры",
                                          headerMergeStyle: TextStyle(
                                              color: theme.primaryColor),
                                          child: Container(
                                              height: 76 *
                                                  biomarkerStock.length
                                                      .toDouble(),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: ScrollConfiguration(
                                                behavior:
                                                    NoRippleScrollBehaviour(),
                                                child: ListView.builder(
                                                    itemCount:
                                                        biomarkerStock.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      var biomarker =
                                                          biomarkerStock[index];
                                                      return BiomarkerItem(
                                                        value:
                                                            biomarker.value ??
                                                                "null",
                                                        unit: biomarker
                                                                .unit
                                                                .content
                                                                .shorthand ??
                                                            "unnamed",
                                                        id: biomarker
                                                            .biomarkerId,
                                                        withActions: false,
                                                      );
                                                    }),
                                              )),
                                        )
                                      : Container(),
                                  BlockBaseWidget(
                                      padding: EdgeInsets.only(
                                          top: Indents.md,
                                          left: Indents.md,
                                          right: Indents.md),
                                      margin:
                                          EdgeInsets.only(bottom: Indents.sm),
                                      header: "Ещё не сдали",
                                      headerMergeStyle:
                                          TextStyle(color: theme.primaryColor),
                                      child: biomarkerNotInStock.length != 0
                                          ? Container(
                                              height: 70 *
                                                  biomarkerNotInStock.length
                                                      .toDouble(),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: ListView.separated(
                                                  separatorBuilder: (context,
                                                          index) =>
                                                      Divider(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface,
                                                      ),
                                                  itemCount:
                                                      biomarkerNotInStock
                                                          .length,
                                                  itemBuilder: (context,
                                                          index) =>
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      Indents
                                                                          .sm),
                                                          child: GestureDetector(
                                                              behavior:
                                                                  HitTestBehavior
                                                                      .opaque,
                                                              child: Text(
                                                                  biomarkerNotInStock[
                                                                          index]
                                                                      .content
                                                                      .name)))),
                                            )
                                          : Text(
                                              "Поздравляем, все биомаркеры сданы! :)"))
                                ]));
                          } else {
                            return Container(
                                padding: EdgeInsets.only(
                                    top: Indents.md,
                                    left: Indents.slg,
                                    right: Indents.md),
                                margin: EdgeInsets.only(bottom: Indents.sm),
                                child: Text("Ожидаем загрузки биомаркеров..."));
                          }
                        });
                  } else {
                    return Container(
                        padding: EdgeInsets.only(
                            top: Indents.md,
                            left: Indents.slg,
                            right: Indents.md),
                        margin: EdgeInsets.only(bottom: Indents.sm),
                        child: Text("Ожидаем загрузки сданных биомаркеров..."));
                  }
                });
          } else {
            return Container(
                padding: EdgeInsets.only(top: Indents.md, left: Indents.slg),
                child: Text("Категории загружаются..."));
          }
        });
  }

  Widget analysisItem(int index, category) {
    final theme = Theme.of(context);

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
              Icon(
                Icons.favorite,
                color: BioMadColors.success,
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
                        "Состояние: 80%",
                        style: theme.textTheme.caption
                            .merge(TextStyle(color: BioMadColors.success)),
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
