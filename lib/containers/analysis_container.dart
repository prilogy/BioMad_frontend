import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding:
          EdgeInsets.only(top: Indents.md, left: Indents.md, right: Indents.md),
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
                  "Дата сдачи анализа",
                  style: theme.textTheme.bodyText1,
                ),
                Text(
                  analysis.date.day.toString() +
                      "." +
                      analysis.date.month.toString() +
                      "." +
                      analysis.date.year.toString(),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: Indents.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Лаборатория",
                  style: theme.textTheme.bodyText1,
                ),
                Text(analysis.lab.content.name),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: Indents.sm),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  160,
              width: MediaQuery.of(context).size.width,
              child: ScrollConfiguration(
                behavior: NoRippleScrollBehaviour(),
                child: ListView.builder(
                    itemCount: analysis.biomarkers.length,
                    itemBuilder: (context, index) => BiomarkerItem(
                          name: analysis
                                  .biomarkers[index].biomarker.content.name ??
                              "Unnamed",
                          value: analysis.biomarkers[index].value ?? "null",
                          unit: analysis
                                  .biomarkers[index].unit.content.shorthand ??
                              "unnamed",
                          id: analysis.biomarkers[index].biomarkerId,
                          withActions: false,
                        )),
              )),
        ],
      ),
    );
  }
}
