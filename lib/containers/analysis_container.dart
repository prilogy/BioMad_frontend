import 'package:api/api.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_item.dart';
import 'package:biomad_frontend/widgets/on_load_container.dart';
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

  Future<List<Biomarker>> getBiomarker() async {
    return await api.biomarker.info();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Future<List<Biomarker>> biomarkers = getBiomarker();
    return Container(
        padding: EdgeInsets.only(left: Indents.md, right: Indents.md),
        margin: EdgeInsets.only(bottom: Indents.sm),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              style:
                  theme.textTheme.subtitle1.merge(TextStyle(color: theme.primaryColor, fontWeight: FontWeight.normal)),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 162,
              width: MediaQuery.of(context).size.width,
              child: ScrollConfiguration(
                  behavior: NoRippleScrollBehaviour(),
                  child: ListView.builder(
                      itemCount: analysis.biomarkers.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                            future: biomarkers,
                            builder: (context, AsyncSnapshot<List<Biomarker>> biomarkers) {
                              if (biomarkers.hasData) {
                                MemberBiomarker memberBiomarkerItem = analysis.biomarkers[index];
                                Biomarker biomarkerItem = biomarkers.data
                                    .firstWhere((element) => element.id == memberBiomarkerItem.biomarkerId);
                                return BiomarkerItem(
                                  value: memberBiomarkerItem.value ?? "null",
                                  unit: memberBiomarkerItem.unit.content.shorthand ?? "unnamed",
                                  unitId: memberBiomarkerItem.unitId,
                                  id: memberBiomarkerItem.biomarkerId,
                                  biomarkerState: biomarkerItem.state,
                                  biomarkerName: biomarkerItem.content.name,
                                  withActions: false,
                                );
                              } else {
                                return OnLoadContainer(
                                  index: index,
                                  padding: EdgeInsets.zero,
                                );
                              }
                            });
                      })))
        ]));
  }
}
