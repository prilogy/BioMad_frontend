import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/all_biomarkers_screen.dart';
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
  final Category category;

  CategoryAnalysisContainer({Key key, @required this.category}) : super(key: key);

  @override
  _CategoryAnalysisContainerState createState() => _CategoryAnalysisContainerState(category);
}

class _CategoryAnalysisContainerState extends State<CategoryAnalysisContainer> {
  final Category category;

  _CategoryAnalysisContainerState(this.category);

  Future<List<Biomarker>> getBiomarker() async {
    return await api.biomarker.info();
  }

  Future<List<MemberBiomarker>> getMemberBiomarker() async {
    return await api.memberBiomarker.info();
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

    Future<List<MemberBiomarker>> memberBiomarkers = getMemberBiomarker();
    MemberBiomarker memberBiomarker;

    Future<List<Biomarker>> biomarkers = getBiomarker();
    List<MemberBiomarker> biomarkerStock = [];
    List<Biomarker> biomarkerNotInStock = [];

    return FutureBuilder(
        future: memberBiomarkers,
        builder: (context, AsyncSnapshot<List<MemberBiomarker>> memberBiomarkers) {
          if (memberBiomarkers.hasData) {
            int allBiomarkers = 0;
            int successfulBiomarkers = 0;
            return FutureBuilder(
                future: biomarkers,
                builder: (context, AsyncSnapshot<List<Biomarker>> biomarkers) {
                  if (biomarkers.hasData) {
                    //Выясняем сданные и не сданные биомаркеры
                    try {
                      biomarkerNotInStock = [];
                      biomarkerStock = [];
                      for (var item in category.biomarkerIds) {
                        memberBiomarker =
                            memberBiomarkers.data.firstWhere((x) => x.biomarkerId == item, orElse: () => null);
                        memberBiomarker != null
                            ? biomarkerStock.add(memberBiomarker)
                            : biomarkerNotInStock
                                .add(biomarkers.data.firstWhere((x) => x.id == item, orElse: () => null));
                      }
                    } catch (e) {
                      biomarkerStock = [];
                      for (var item in category.biomarkerIds) {
                        biomarkerNotInStock.add(biomarkers.data.firstWhere((x) => x.id == item, orElse: () => null));
                      }
                    }
                    biomarkerStock.removeWhere((value) => value == null);
                    biomarkerNotInStock.removeWhere((value) => value == null);

                    //Выясняем сосотояние категории
                    try {
                      allBiomarkers = 0;
                      successfulBiomarkers = 0;
                      for (var item in memberBiomarkers.data) {
                        if (category.biomarkerIds.contains(item.biomarkerId)) {
                          allBiomarkers++;
                          Biomarker biomarkerItem =
                              biomarkers.data.firstWhere((element) => element.id == item.biomarkerId);
                          if (biomarkerItem?.state == BiomarkerStateType.number2_) successfulBiomarkers++;
                          if (item.dateCreatedAt.millisecondsSinceEpoch > epochTime)
                            dateOfChanged = item.dateCreatedAt.toLocal();
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
                      status = "отличное";
                    } else if (state >= 40.0) {
                      color = BioMadColors.warning;
                      status = "удовлетворительное";
                    } else if (state > 0.0 && state < 40.0) {
                      color = BioMadColors.error;
                      status = "ужасное";
                    } else {
                      color = BioMadColors.base[400];
                      status = "не определено";
                    }

                    return Container(
                        height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
                        child: ScrollConfiguration(
                            behavior: NoRippleScrollBehaviour(),
                            child: ListView(children: [
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                BlockBaseWidget(
                                    padding: EdgeInsets.only(left: Indents.md, right: Indents.md),
                                    margin: EdgeInsets.only(bottom: Indents.sm),
                                    header: "Общее состояние",
                                    headerMergeStyle: TextStyle(color: theme.primaryColor),
                                    child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(state.round().toString() + "%",
                                              style:
                                                  Theme.of(context).textTheme.headline3.merge(TextStyle(color: color))),
                                          Container(
                                            padding: EdgeInsets.only(left: Indents.sm),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(status, style: Theme.of(context).textTheme.bodyText1),
                                                Row(
                                                  children: [
                                                    Text(
                                                        dateOfChanged != null
                                                            ? "Обновлено: " +
                                                                dateOfChanged.day.toString() +
                                                                '.' +
                                                                zeroAdding(dateOfChanged.month) +
                                                                '.' +
                                                                dateOfChanged.year.toString() +
                                                                ' в ' +
                                                                dateOfChanged.hour.toString() +
                                                                ':' +
                                                                zeroAdding(dateOfChanged.minute)
                                                            : "Анализы не загружены",
                                                        style: Theme.of(context).textTheme.bodyText2),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ])),
                                biomarkerStock.isNotEmpty
                                    ? Container(
                                        padding: EdgeInsets.only(top: Indents.md, left: Indents.md, right: Indents.md),
                                        margin: EdgeInsets.only(bottom: Indents.sm),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    alignment: Alignment.topLeft,
                                                    margin: EdgeInsets.only(bottom: Indents.sm),
                                                    child: Text("Последние биомаркеры",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6
                                                            .merge(TextStyle(color: theme.primaryColor)))),
                                                biomarkerStock.length > 3
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          return showDialog(
                                                              context: context,
                                                              builder: (BuildContext context) {
                                                                return AllBiomarkersScreen(
                                                                  memberBiomarkers: biomarkerStock,
                                                                );
                                                              });
                                                        },
                                                        child: Container(
                                                            child: Text(
                                                                "ВСЕ (" + biomarkerStock.length.toString() + ")",
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .subtitle1
                                                                    .merge(TextStyle(color: theme.primaryColor)))),
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                            ScrollConfiguration(
                                              behavior: NoRippleScrollBehaviour(),
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemCount: biomarkerStock.length <= 3 ? biomarkerStock.length : 3,
                                                  itemBuilder: (context, index) {
                                                    MemberBiomarker memberBiomarkerItem = biomarkerStock[index];
                                                    Biomarker biomarkerItem = biomarkers.data.firstWhere(
                                                        (element) => element.id == memberBiomarkerItem.biomarkerId);

                                                    return BiomarkerItem(
                                                      index: index,
                                                      value: memberBiomarkerItem.value ?? "null",
                                                      unit: memberBiomarkerItem.unit.content.shorthand ?? "unnamed",
                                                      unitId: memberBiomarkerItem.unitId,
                                                      id: memberBiomarkerItem.biomarkerId,
                                                      biomarkerState: biomarkerItem.state,
                                                      biomarkerName: biomarkerItem.content.name,
                                                      withActions: false,
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                BlockBaseWidget(
                                    padding: EdgeInsets.only(top: Indents.md, left: Indents.md, right: Indents.md),
                                    margin: EdgeInsets.only(bottom: Indents.sm),
                                    header: "Ещё не сдали",
                                    headerMergeStyle: TextStyle(color: theme.primaryColor),
                                    child: biomarkerNotInStock.length != 0
                                        ? ListView.separated(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            separatorBuilder: (context, index) => Divider(
                                                  color: Theme.of(context).colorScheme.onSurface,
                                                ),
                                            itemCount: biomarkerNotInStock.length,
                                            itemBuilder: (context, index) => Container(
                                                padding: EdgeInsets.symmetric(vertical: Indents.sm),
                                                child: GestureDetector(
                                                    behavior: HitTestBehavior.opaque,
                                                    child: Text(biomarkerNotInStock[index].content.name))))
                                        : Text("Поздравляем, все биомаркеры сданы! :)"))
                              ]),
                            ])));
                  } else {
                    return Container(
                        padding: EdgeInsets.only(top: Indents.md, left: Indents.slg, right: Indents.md),
                        margin: EdgeInsets.only(bottom: Indents.sm),
                        child: Text("Ожидаем загрузки биомаркеров..."));
                  }
                });
          } else {
            return Container(
                padding: EdgeInsets.only(top: Indents.md, left: Indents.slg, right: Indents.md),
                margin: EdgeInsets.only(bottom: Indents.sm),
                child: Text("Ожидаем загрузки сданных биомаркеров..."));
          }
        });
  }

  Widget analysisItem(int index, category) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Keys.rootNavigator.currentState.pushReplacementNamed(Routes.category_analysis, arguments: category.id);
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
                        style: theme.textTheme.caption.merge(TextStyle(color: BioMadColors.success)),
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
