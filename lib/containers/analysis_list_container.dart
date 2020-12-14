import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/analysis_list.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/analysis_screen.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AnalysisListContainer extends StatefulWidget {
  @override
  _AnalysisListContainerState createState() => _AnalysisListContainerState();
}

class _AnalysisListContainerState extends State<AnalysisListContainer> {
  @override
  Widget build(BuildContext context) {
    List<MemberAnalysis> analysis = store.state.memberAnalysisList.analysis;

    return analysis.length > 0
        ? Container(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                61,
            width: MediaQuery.of(context).size.width,
            child: StoreConnector<AppState, List<MemberAnalysis>>(
                converter: (store) => store.state.memberAnalysisList.analysis,
                builder: (ctx, state) {
                  return ScrollConfiguration(
                    behavior: NoRippleScrollBehaviour(),
                    child: ListView.builder(
                        itemCount: analysis.length,
                        itemBuilder: (context, index) =>
                            analysisItem(index, analysis[index])),
                  );
                }))
        : Container(
            padding: EdgeInsets.only(left: Indents.sm, right: Indents.sm),
            margin: EdgeInsets.only(left: Indents.md, right: Indents.md),
            child: Text("Анализы еще не добавлены :("));
  }

  String zeroAdding(int value) {
    return value > 10 ? value.toString() : "0" + value.toString();
  }

  Widget analysisItem(int index, MemberAnalysis analysis) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AnalysisScreen(analysis: analysis);
            });
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
                Icons.assignment_outlined,
                color: BioMadColors.success,
                size: 32.0,
              ),
              Container(
                padding: EdgeInsets.all(Indents.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      analysis.name,
                      style: theme.textTheme.bodyText2,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        analysis.dateCreatedAt.day.toString() +
                            "." +
                            zeroAdding(analysis.dateCreatedAt.month) +
                            "." +
                            analysis.dateCreatedAt.year.toString() +
                            " в " +
                            analysis.dateCreatedAt.hour.toString() +
                            ":" +
                            zeroAdding(analysis.dateCreatedAt.minute),
                        style: theme.textTheme.caption,
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
