import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/biomarker_item.dart';
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

  @override
  void initState() {
    store.dispatch(StoreThunks.refreshMemberBiomarkers());
    print("refreshMemberBiomarkers".toUpperCase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var category = store.state.categoryList.categories
        .firstWhere((element) => element.id == categoryId);

    var memberBiomarkerList = store.state.memberBiomarkerList.biomarkers;
    List<MemberBiomarker> biomarkerStock = [];
    List<Biomarker> biomarkerNotInStock = [];
    MemberBiomarker memberBiomarker;

    for (var item in category.biomarkerIds) {
      memberBiomarker = memberBiomarkerList
          .firstWhere((x) => x.biomarker.id == item, orElse: () => null);
      memberBiomarker != null
          ? biomarkerStock.add(memberBiomarker)
          : biomarkerNotInStock.add(store.state.biomarkerList.biomarkers
              .firstWhere((x) => x.id == item, orElse: () => null));
    }

    biomarkerStock.removeWhere((value) => value == null);
    biomarkerNotInStock.removeWhere((value) => value == null);

    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BlockBaseWidget(
          padding: EdgeInsets.only(
              top: Indents.md, left: Indents.md, right: Indents.md),
          margin: EdgeInsets.only(bottom: Indents.sm),
          header: "Общее состояние",
          headerMergeStyle: TextStyle(color: theme.primaryColor),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("50%",
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .merge(TextStyle(color: BioMadColors.warning))),
                Container(
                  padding: EdgeInsets.only(left: Indents.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Удовлетворительное",
                          style: Theme.of(context).textTheme.bodyText1),
                      Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_up,
                            size: 22.0,
                            color: BioMadColors.warning,
                          ),
                          Text("14 ноября, 2020",
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                    ],
                  ),
                )
              ])),
      BlockBaseWidget(
        padding: EdgeInsets.only(
            top: Indents.md, left: Indents.md, right: Indents.md),
        margin: EdgeInsets.only(bottom: Indents.sm),
        header: "Последние биомаркеры",
        headerMergeStyle: TextStyle(color: theme.primaryColor),
        child: Container(
            height: 76 * biomarkerStock.length.toDouble(),
            width: MediaQuery.of(context).size.width,
            child: ScrollConfiguration(
              behavior: NoRippleScrollBehaviour(),
              child: ListView.builder(
                  itemCount: biomarkerStock.length,
                  itemBuilder: (context, index) => BiomarkerItem(
                      status: "<status>",
                      id: biomarkerStock[index].biomarker.id,
                      biomarker: biomarkerStock[index],
                      withActions: false)),
            )),
      ),
      BlockBaseWidget(
          padding: EdgeInsets.only(
              top: Indents.md, left: Indents.md, right: Indents.md),
          margin: EdgeInsets.only(bottom: Indents.sm),
          header: "Ещё не сдали",
          headerMergeStyle: TextStyle(color: theme.primaryColor),
          child: biomarkerNotInStock.length != 0
              ? Container(
                  height: 70 * biomarkerNotInStock.length.toDouble(),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                      itemCount: biomarkerNotInStock.length,
                      itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.symmetric(vertical: Indents.sm),
                          child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Text(
                                  biomarkerNotInStock[index].content.name)))),
                )
              : Text("Поздравляем, все биомаркеры сданы! :)"))
    ]));
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
