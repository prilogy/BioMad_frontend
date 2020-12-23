import 'package:api/api.dart';
import 'package:biomad_frontend/containers/account_container.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_item.dart';
import 'package:biomad_frontend/widgets/nav_bar.dart';
import 'package:biomad_frontend/widgets/on_load_container.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BioMarkerListScreen extends StatefulWidget {
  final int id;

  BioMarkerListScreen({Key key, this.id}) : super(key: key);

  @override
  _BioMarkerListScreenState createState() => _BioMarkerListScreenState(id);
}

class _BioMarkerListScreenState extends State<BioMarkerListScreen> {
  final int id;

  _BioMarkerListScreenState(this.id);

  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen = 500;
  double _panelHeightClosed = 0;
  PanelController _panelController = PanelController();

  Future<List<MemberBiomarker>> getMemberBiomarker() async {
    return await api.memberBiomarker.info();
  }

  Future<List<BiomarkerType>> getType() async {
    return await api.biomarker.type();
  }

  Future<List<Biomarker>> getBiomarker() async {
    return await api.biomarker.info();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Future<List<MemberBiomarker>> memberBiomarkers = getMemberBiomarker();
    Future<List<BiomarkerType>> types = getType();

    MemberBiomarker biomarker;
    bool isBiomarkerInType = false;
    Future<List<Biomarker>> biomarkers = getBiomarker();
    return Container(
        height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 50,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          FutureBuilder(
              future: memberBiomarkers,
              builder: (context, AsyncSnapshot<List<MemberBiomarker>> memberBiomarkers) {
                if (memberBiomarkers.hasData) {
                  return Container(width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: Indents.md, left: Indents.slg, right: Indents.md),
                      margin: EdgeInsets.only(bottom: Indents.sm),
                      child: FutureBuilder(
                          future: types,
                          builder: (context, AsyncSnapshot<List<BiomarkerType>> types) {
                            if (types.hasData) {
                              List<MemberBiomarker> biomarkerList = [];
                              return memberBiomarkers.data.isNotEmpty
                                  ? ScrollConfiguration(
                                      behavior: NoRippleScrollBehaviour(),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: types.data.length,
                                          itemBuilder: (context, index) {
                                            try {
                                              biomarkerList = [];
                                              for (var bio in types.data[index].biomarkerIds) {
                                                try {
                                                  biomarker = memberBiomarkers.data
                                                      .firstWhere((x) => x.biomarkerId == bio, orElse: null);
                                                  biomarkerList.add(biomarker);
                                                  isBiomarkerInType = true;
                                                } catch (e) {}
                                              }
                                            } catch (e) {
                                              print("IN TYPES OF BIOMARKER LIST: " + e.toString());
                                              biomarker = null;
                                              isBiomarkerInType = false;
                                            }
                                            return isBiomarkerInType && types.data[index].content != null
                                                ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(types.data[index].content.name.toUpperCase(),
                                                          style: theme.textTheme.caption
                                                              .merge(TextStyle(fontWeight: FontWeight.normal))),
                                                      ListView.builder(
                                                          shrinkWrap: true,
                                                          physics: NeverScrollableScrollPhysics(),
                                                          itemCount: biomarkerList.length,
                                                          itemBuilder: (context, i) {
                                                            return FutureBuilder(
                                                                future: biomarkers,
                                                                builder: (context,
                                                                    AsyncSnapshot<List<Biomarker>> biomarkers) {
                                                                  if (biomarkers.hasData) {
                                                                    MemberBiomarker memberBiomarkerItem =
                                                                        biomarkerList[i];
                                                                    Biomarker biomarkerItem = biomarkers.data
                                                                        .firstWhere((element) =>
                                                                            element.id ==
                                                                            memberBiomarkerItem.biomarkerId);
                                                                    return BiomarkerItem(
                                                                      value: memberBiomarkerItem.value ?? "null",
                                                                      unit:
                                                                          memberBiomarkerItem.unit.content.shorthand ??
                                                                              "unnamed",
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
                                                          })
                                                    ],
                                                  )
                                                : Container();
                                          }),
                                    )
                                  : Container(child: Text("Тут пусто. Вы ещё не сдали ни одного биомаркера :("));
                            } else {
                              return Container(child: Text("Ожидаем загрузки типов..."));
                            }
                          }));
                } else {
                  return Container(
                      padding: EdgeInsets.only(top: Indents.md, left: Indents.slg, right: Indents.md),
                      margin: EdgeInsets.only(bottom: Indents.sm),
                      child: Text("Ожидаем загрузки биомаркеров..."));
                }
              }),
          Positioned(
              bottom: NavBar.indent,
              right: NavBar.indent,
              child: NavBar(
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
        ])); // This trailin);
  }
}
