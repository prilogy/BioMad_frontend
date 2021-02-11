import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/screens/analysis_screen.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/nav_bar.dart';
import 'package:biomad_frontend/widgets/on_load_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnalysisListContainer extends StatefulWidget {
  @override
  _AnalysisListContainerState createState() => _AnalysisListContainerState();
}

class _AnalysisListContainerState extends State<AnalysisListContainer> {
  Future<List<MemberAnalysis>> getAnalysis() async {
    return await api.memberAnalysis.info();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<MemberAnalysis>> analysis = getAnalysis();

    return FutureBuilder(
        future: analysis,
        builder: (context, AsyncSnapshot<List<MemberAnalysis>> analysis) {
          if (analysis.hasData) {
            return analysis.data.length > 0
                ? Container(
                    height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - NavBar.size,
                    child: ListView.builder(
                        itemCount: analysis.data.length, itemBuilder: (context, index) => analysisItem(index, analysis.data[index])),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - NavBar.size,
                    padding: EdgeInsets.only(left: Indents.sm, right: Indents.sm),
                    margin: EdgeInsets.only(left: Indents.md, right: Indents.md),
                    child: Text("Анализы еще не добавлены :("));
          } else {
            return Container(
              height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 61,
              child: ScrollConfiguration(
                  behavior: NoRippleScrollBehaviour(),
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) => OnLoadContainer(
                            index: index,
                          ))),
            );
          }
        });
  }

  String zeroAdding(int value) {
    return value > 10 ? value.toString() : "0" + value.toString();
  }

  Widget analysisItem(int index, MemberAnalysis analysis) {
    final theme = Theme.of(context);
    double chars = (MediaQuery.of(context).size.width - 100) / 8 - 10;

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
        margin: EdgeInsets.only(top: index == 0 ? 0 : Indents.smd, left: Indents.md, right: Indents.md),
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
                padding: EdgeInsets.only(top: Indents.md, left: Indents.md, bottom: Indents.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      analysis.name.length > chars.toInt() ? analysis.name.substring(0, chars.toInt() - 2) + "..." : analysis.name,
                      style: theme.textTheme.bodyText2,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        zeroAdding(analysis.dateCreatedAt.day) +
                            "." +
                            zeroAdding(analysis.dateCreatedAt.month) +
                            "." +
                            analysis.dateCreatedAt.year.toString() +
                            " - " +
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
