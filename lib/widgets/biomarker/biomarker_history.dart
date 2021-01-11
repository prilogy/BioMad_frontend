import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BiomarkerHistory extends StatelessWidget {
  final MemberBiomarker memberBiomarker;
  final String title;

  BiomarkerHistory({
    this.memberBiomarker,
    this.title,
  });

  BiomarkerHistory.forScrollingViews({
    this.memberBiomarker,
    this.title,
  });

  Future<Biomarker> getBiomarkerById(int id, int unitId) async {
    return await api.biomarker.infoById(id, unitId);
  }

  Future<List<MemberBiomarker>> getBiomarkerHistory(int id) async {
    return await api.memberBiomarker.history(id, memberBiomarker.unitId);
  }

  Future<List<MemberBiomarker>> biomarkerHistory;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    biomarkerHistory = getBiomarkerHistory(memberBiomarker.biomarkerId);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(bottom: Indents.sm),
        child: Text(
          tr('biomarker.history'),
          style: theme.textTheme.headline6.merge(TextStyle(color: theme.primaryColor)),
        ),
      ),
      FutureBuilder(
          future: biomarkerHistory,
          builder: (context, AsyncSnapshot<List<MemberBiomarker>> biomarkerHistory) {
            if (biomarkerHistory.hasData) {
              return Container(
                height: 20 * biomarkerHistory.data.length.toDouble() <= 80
                    ? 20 * biomarkerHistory.data.length.toDouble()
                    : 80,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: biomarkerHistory.data.length,
                    itemBuilder: (context, index) => historyItem(context, index, biomarkerHistory.data[index])),
              );
            } else {
              return Container(
                height: 60,
                child: ScrollConfiguration(
                    behavior: NoRippleScrollBehaviour(),
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 14,
                                    width: 100,
                                    margin: EdgeInsets.only(bottom: Indents.sm),
                                    decoration: BoxDecoration(
                                      color: BioMadColors.base[200].withOpacity(0.8),
                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                    )),
                                Container(
                                    height: 14,
                                    width: 160,
                                    margin: EdgeInsets.only(bottom: Indents.sm),
                                    decoration: BoxDecoration(
                                      color: BioMadColors.base[200].withOpacity(0.8),
                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                    )),
                              ],
                            ))),
              );
            }
          })
    ]);
  }

  Widget historyItem(context, int index, MemberBiomarker data) {
    final theme = Theme.of(context);

    var color;
    var status;
    var icon;

    String zeroAdding(int value) {
      return value > 10 ? value.toString() : "0" + value.toString();
    }

    Future<Biomarker> biomarker = getBiomarkerById(data.biomarkerId, data.unitId);

    return FutureBuilder(
        future: biomarker,
        builder: (context, AsyncSnapshot<Biomarker> biomarker) {
          if (biomarker.hasData) {
            if (data.value >= biomarker.data.reference.valueA && data.value <= biomarker.data.reference.valueB) {
              color = BioMadColors.success;
              status = tr('state.normal');
            } else if (data.value < biomarker.data.reference.valueA) {
              color = BioMadColors.warning;
              status = tr('state.reduced');
              icon = Icons.keyboard_arrow_down;
            } else if (data.value > biomarker.data.reference.valueB) {
              color = BioMadColors.warning;
              status = tr('state.elevated');
              icon = Icons.keyboard_arrow_up;
            } else {
              status = tr('state.undefined');
              icon = Icons.keyboard_arrow_right;
            }

            var iconContainer = Container(
                height: 6.0,
                width: 6.0,
                decoration: new BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ));
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.dateCreatedAt.day.toString() +
                        '.' +
                        zeroAdding(data.dateCreatedAt.month) +
                        '.' +
                        data.dateCreatedAt.year.toString() +
                        ' ' +
                        data.dateCreatedAt.hour.toString() +
                        ':' +
                        zeroAdding(data.dateCreatedAt.minute),
                    style: theme.textTheme.bodyText1,
                  ),
                  Row(
                    children: [
                      Container(
                          padding: status == tr('state.normal') ? EdgeInsets.only(right: Indents.sm) : null,
                          child: icon != null ? Icon(icon, color: color, size: 18.0) : iconContainer),
                      Text(
                        data.value.toString() + " " + data.unit.content.shorthand + ", " + status,
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 14,
                    width: 100,
                    margin: EdgeInsets.only(bottom: Indents.sm),
                    decoration: BoxDecoration(
                      color: BioMadColors.base[200].withOpacity(0.8),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    )),
                Container(
                    height: 14,
                    width: 160,
                    margin: EdgeInsets.only(bottom: Indents.sm),
                    decoration: BoxDecoration(
                      color: BioMadColors.base[200].withOpacity(0.8),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    )),
              ],
            );
          }
        });
  }
}
