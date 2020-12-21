import 'package:api/api.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
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
          "История",
          style: theme.textTheme.headline6
              .merge(TextStyle(color: theme.primaryColor)),
        ),
      ),
      FutureBuilder(
          future: biomarkerHistory,
          builder:
              (context, AsyncSnapshot<List<MemberBiomarker>> biomarkerHistory) {
            if (biomarkerHistory.hasData) {
              return Container(
                height: 20 * biomarkerHistory.data.length.toDouble() <= 80
                    ? 20 * biomarkerHistory.data.length.toDouble()
                    : 80,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: biomarkerHistory.data.length,
                    itemBuilder: (context, index) => historyItem(
                        context, index, biomarkerHistory.data[index])),
              );
            } else {
              return Container(
                child: Text("Загрузка истории"),
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
            if (biomarker.data.state == BiomarkerStateType.number2_) {
              color = BioMadColors.success;
              status = "норма";
            } else if (biomarker.data.state == BiomarkerStateType.number1_) {
              color = BioMadColors.warning;
              status = "пониженный";
              icon = Icons.keyboard_arrow_down;
            } else if (biomarker.data.state == BiomarkerStateType.number0_) {
              color = BioMadColors.warning;
              status = "повышенный";
              icon = Icons.keyboard_arrow_up;
            } else {
              status = "не определено";
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
                          padding: status == "норма"
                              ? EdgeInsets.only(right: Indents.sm)
                              : null,
                          child: icon != null
                              ? Icon(icon, color: color, size: 18.0)
                              : iconContainer),
                      Text(
                        data.value.toString() +
                            " " +
                            data.unit.content.shorthand +
                            ", " +
                            status,
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Container(
                child: Text("Элемент истории загружается..."));
          }
        });
  }
}
