import 'package:api/api.dart';
import 'package:biomad_frontend/containers/account_container.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_item.dart';
import 'package:biomad_frontend/widgets/nav_bar.dart';
import 'package:biomad_frontend/widgets/on_load_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BioMarkerListScreen extends StatefulWidget {
  final List<BiomarkerType> types;
  final List<MemberBiomarker> memberBiomarkers;
  final List<Biomarker> biomarkers;

  BioMarkerListScreen({Key key, this.types, this.memberBiomarkers, this.biomarkers}) : super(key: key);

  @override
  _BioMarkerListScreenState createState() => _BioMarkerListScreenState(types, memberBiomarkers, biomarkers);
}

class _BioMarkerListScreenState extends State<BioMarkerListScreen> {
  final List<BiomarkerType> types;
  final List<MemberBiomarker> memberBiomarkers;
  final List<Biomarker> biomarkers;

  _BioMarkerListScreenState(this.types, this.memberBiomarkers, this.biomarkers);

  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen = 500;
  double _panelHeightClosed = 0;
  PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    MemberBiomarker biomarker;
    bool isBiomarkerInType = false;
    List<MemberBiomarker> biomarkerList = [];
    return WillPopScope(
        onWillPop: () async {
          Keys.rootNavigator.currentState.pushReplacementNamed(Routes.main);
          return false;
        },
        child: Container(
            height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - NavBar.size,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: Indents.md, left: Indents.slg, right: Indents.md),
                  child: memberBiomarkers.isNotEmpty
                      ? ScrollConfiguration(
                          behavior: NoRippleScrollBehaviour(),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: types.length,
                              itemBuilder: (context, index) {
                                try {
                                  biomarkerList = [];
                                  for (var bio in types[index].biomarkerIds) {
                                    try {
                                      biomarker =
                                          memberBiomarkers.firstWhere((x) => x.biomarkerId == bio, orElse: null);
                                      biomarkerList.add(biomarker);
                                      isBiomarkerInType = true;
                                    } catch (e) {}
                                  }
                                } catch (e) {
                                  print("IN TYPES OF BIOMARKER LIST: " + e.toString());
                                  biomarker = null;
                                  isBiomarkerInType = false;
                                }
                                return isBiomarkerInType && types[index].content != null
                                    ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Text(types[index].content.name.toUpperCase(),
                                            style: theme.textTheme.caption
                                                .merge(TextStyle(fontWeight: FontWeight.normal))),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: biomarkerList.length,
                                            itemBuilder: (context, i) {
                                              MemberBiomarker memberBiomarkerItem = biomarkerList[i];
                                              Biomarker biomarkerItem = biomarkers.firstWhere(
                                                  (element) => element.id == memberBiomarkerItem.biomarkerId);
                                              return BiomarkerItem(
                                                value: memberBiomarkerItem.value ?? "null",
                                                unit: memberBiomarkerItem.unit.content.shorthand ?? "unnamed",
                                                unitId: memberBiomarkerItem.unitId,
                                                id: memberBiomarkerItem.biomarkerId,
                                                biomarkerState: biomarkerItem.state,
                                                biomarkerName: biomarkerItem.content.name,
                                                withActions: false,
                                              );
                                            })
                                      ])
                                    : Container();
                              }))
                      : Container(child: Text(tr('loader.null_biomarkers')),)),
              Positioned(
                  bottom: NavBar.indent,
                  right: NavBar.indent,
                  child: NavBar(
                    isSearch: true,
                    onAvatarTap: () {
                      _panelController.open();
                    },
                  )),
              SlidingUpPanel(
                backdropEnabled: true,
                controller: _panelController,
                maxHeight: _panelHeightOpen,
                minHeight: _panelHeightClosed,
                parallaxEnabled: true,
                parallaxOffset: .5,
                panelBuilder: (sc) => ListView(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  children: [
                    AccountContainer(),
                  ],
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(RadiusValues.main), topRight: Radius.circular(RadiusValues.main)),
                onPanelSlide: (double pos) => setState(() {
                  _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
                }),
              ),
            ]))); // This trailin);
  }
}
