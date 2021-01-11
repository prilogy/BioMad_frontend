import 'package:api/api.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_history.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_info.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:easy_localization/easy_localization.dart';
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
    String referenceRange;
    try {
      if (biomarker.state == BiomarkerStateType.number2_) {
        color = BioMadColors.success;
        status = tr('state.normal');
      } else if (biomarker.state == BiomarkerStateType.number1_) {
        color = BioMadColors.warning;
        status = tr('state.reduced');
        icon = Icons.keyboard_arrow_down;
      } else if (biomarker.state == BiomarkerStateType.number0_) {
        color = BioMadColors.warning;
        status = tr('state.elevated');
        icon = Icons.keyboard_arrow_up;
      } else {
        status = tr('state.undefined');
        icon = Icons.keyboard_arrow_right;
      }
      referenceRange = biomarker.reference.valueA.toString() +
          "-" +
          biomarker.reference.valueB.toString() +
          " " +
          memberBiomarker.unit.content.shorthand;
    } catch (e) {
      status = tr('loader.load_data');
      referenceRange = tr('loader.load_reference');
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
                        tr('biomarker.value'),
                        style: theme.textTheme.bodyText1,
                      ),
                      Row(
                        children: [
                          Container(
                              padding: status == tr('state.normal')
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
                      tr('biomarker.normal'),
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
                        Text(referenceRange),
                      ],
                    ),
                  ],
                ),
              ],
            )),
        BlockBaseWidget(
            padding: EdgeInsets.only(
                top: Indents.md, left: Indents.md, right: Indents.md),
            margin: EdgeInsets.only(bottom: 0),
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
