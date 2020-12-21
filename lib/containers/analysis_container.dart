import 'package:api/api.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class AnalysisContainer extends StatefulWidget {
  final MemberAnalysis analysis;

  AnalysisContainer({
    this.analysis,
    Key key,
  }) : super(key: key);

  @override
  _AnalysisContainerState createState() => _AnalysisContainerState(analysis);
}

class _AnalysisContainerState extends State<AnalysisContainer> {
  final MemberAnalysis analysis;

  _AnalysisContainerState(this.analysis);

  String zeroAdding(int value) {
    return value > 9 ? value.toString() : "0" + value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left: Indents.md, right: Indents.md),
      margin: EdgeInsets.only(bottom: Indents.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: Indents.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Дата и время сдачи",
                  style: theme.textTheme.bodyText1,
                ),
                Text(
                  analysis.dateCreatedAt.day.toString() +
                      "." +
                      zeroAdding(analysis.dateCreatedAt.month) +
                      "." +
                      analysis.dateCreatedAt.year.toString() +
                      " в " +
                      analysis.dateCreatedAt.hour.toString() +
                      ":" +
                      zeroAdding(analysis.dateCreatedAt.minute),
                ),
              ],
            ),
          ),
//          Container(
//            margin: EdgeInsets.only(bottom: Indents.sm),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: [
//                Text(
//                  "Лаборатория",
//                  style: theme.textTheme.bodyText1,
//                ),
//                Text(analysis.lab.content.name),
//              ],
//            ),
//          ),
          Container(
            margin: EdgeInsets.only(bottom: Indents.sm),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Примечание",
                  style: theme.textTheme.bodyText1,
                ),
                Text(analysis.description),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Indents.sm),
            child: Text(
              "Биомаркеры",
              style: theme.textTheme.subtitle1.merge(TextStyle(
                  color: theme.primaryColor, fontWeight: FontWeight.normal)),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  162,
              width: MediaQuery.of(context).size.width,
              child: ScrollConfiguration(
                behavior: NoRippleScrollBehaviour(),
                child: ListView.builder(
                    itemCount: analysis.biomarkers.length,
                    itemBuilder: (context, index) => BiomarkerItem(
                          value: analysis.biomarkers[index].value ?? "null",
                          unit: analysis
                                  .biomarkers[index].unit.content.shorthand ??
                              "unnamed",
                          unitId: analysis.biomarkers[index].unitId,
                          id: analysis.biomarkers[index].biomarkerId,
                          withActions: false,
                        )),
              )),
        ],
      ),
    );
  }
}
