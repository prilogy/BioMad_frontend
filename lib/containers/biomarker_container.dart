import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/monitoring_screen.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/biomarker_history.dart';
import 'package:biomad_frontend/widgets/biomarker_info.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom_button.dart';
import 'package:biomad_frontend/widgets/drop_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BiomarkerContainer extends StatefulWidget {
  final int id;
  final MemberBiomarker memberBiomarker;

  BiomarkerContainer({Key key, this.id, this.memberBiomarker})
      : super(key: key);

  @override
  _BiomarkerContainerState createState() =>
      _BiomarkerContainerState(id, memberBiomarker);
}

class _BiomarkerContainerState extends State<BiomarkerContainer> {
  final int id;
  MemberBiomarker memberBiomarker;
  Biomarker biomarker;

  _BiomarkerContainerState(this.id, this.memberBiomarker);

  Future<Biomarker> getBiomarker(int id) async {
    return await api.biomarker.infoById(id, memberBiomarker.unitId);
  }

  Future<MemberBiomarker> getMemberBiomarker(int id) async {
    return await api.memberBiomarker.infoById(id, memberBiomarker.unitId);
  }

  @override
  void initState() {
    getBiomarker(memberBiomarker.biomarkerId).then((x) => {
          setState(() {
            biomarker = x;
          })
        });

    getMemberBiomarker(memberBiomarker.id).then((x) => {
          setState(() {
            memberBiomarker = x;
          })
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var color;
    var status;
    var icon;
    Biomarker biomarker = store.state.biomarkerList.biomarkers
        .firstWhere((element) => element.id == memberBiomarker.biomarkerId);

    if (biomarker.state == BiomarkerStateType.number2_) {
      color = BioMadColors.success;
      status = "норма";
    } else if (biomarker.state == BiomarkerStateType.number1_) {
      color = BioMadColors.warning;
      status = "пониженный";
      icon = Icons.keyboard_arrow_down;
    } else if (biomarker.state == BiomarkerStateType.number0_) {
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BlockBaseWidget(
            padding: EdgeInsets.only(left: Indents.md, right: Indents.md),
            margin: EdgeInsets.only(bottom: Indents.sm),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: Indents.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Ваш показатель",
                        style: theme.textTheme.bodyText1,
                      ),
                      Row(
                        children: [
                          Container(
                              padding: status == "норма"
                                  ? EdgeInsets.only(right: Indents.sm)
                                  : null,
                              child: icon != null
                                  ? Icon(icon, color: color)
                                  : iconContainer),
                          Text(
                            memberBiomarker.value.toString() +
                                " " +
                                memberBiomarker.unit.content.shorthand +
                                ", " +
                                status,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Норма",
                      style: theme.textTheme.bodyText1,
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(right: Indents.sm),
                            child: Container(
                                height: 6.0,
                                width: 6.0,
                                decoration: new BoxDecoration(
                                  color: BioMadColors.success,
                                  shape: BoxShape.circle,
                                ))),
                        Text(biomarker.reference.valueA.toString() +
                            "-" +
                            biomarker.reference.valueB.toString() +
                            " " +
                            memberBiomarker.unit.content.shorthand),
                      ],
                    ),
                  ],
                ),
              ],
            )),
        BlockBaseWidget(
            padding: EdgeInsets.only(
                top: Indents.md, left: Indents.md, right: Indents.md),
            margin: EdgeInsets.only(bottom: Indents.sm),
            child: BiomarkerHistory(
              memberBiomarker: memberBiomarker,
            )),
        BlockBaseWidget(
            padding: EdgeInsets.only(
                top: Indents.md, left: Indents.md, right: Indents.md),
            margin: EdgeInsets.only(bottom: Indents.sm),
            child: BiomarkerInfo(biomarker: biomarker)),
      ]),
    );
  }
}
