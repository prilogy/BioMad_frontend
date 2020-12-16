import 'package:api/api.dart';
import 'package:biomad_frontend/containers/account_container.dart';
import 'package:biomad_frontend/containers/biomarker_container.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/biomarker_item.dart';
import 'package:biomad_frontend/widgets/custom_circle_avatar.dart';
import 'package:biomad_frontend/widgets/custom_divider.dart';
import 'package:biomad_frontend/widgets/custom_list_tile.dart';
import 'package:biomad_frontend/widgets/nav_bar.dart';
import 'package:biomad_frontend/widgets/nav_top_bar.dart';
import 'package:easy_localization/easy_localization.dart';
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

  @override
  void initState() {
    super.initState();
  }

  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen = 500;
  double _panelHeightClosed = 0;
  PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var types = store.state.biomarkerTypeList.types;
    types.removeWhere((value) => value.content == null);

    var memberBiomarkerList = store.state.memberBiomarkerList.biomarkers;
    MemberBiomarker biomarker;
    bool isBiomarkerInType = false;

    return Stack(children: [
      store.state.memberBiomarkerList.biomarkers.isNotEmpty
          ? Container(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  55,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: Indents.md, left: Indents.slg, right: Indents.md),
              margin: EdgeInsets.only(bottom: Indents.sm),
              child: ScrollConfiguration(
                behavior: NoRippleScrollBehaviour(),
                child: ListView.builder(
                    itemCount: types.length,
                    itemBuilder: (context, index) {
                      try {
                        biomarker = memberBiomarkerList.firstWhere((x) =>
                            types[index].biomarkerIds.contains(x.biomarkerId));
                        isBiomarkerInType = true;
                      } catch (e) {
                        biomarker = null;
                        isBiomarkerInType = false;
                      }
                      return isBiomarkerInType
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(types[index].content.name.toUpperCase(),
                                    style: theme.textTheme.caption.merge(
                                        TextStyle(
                                            fontWeight: FontWeight.normal))),
                                Container(
                                    height: 76 *
                                        types[index]
                                            .biomarkerIds
                                            .length
                                            .toDouble(),
                                    width: MediaQuery.of(context).size.width,
                                    child: ScrollConfiguration(
                                        behavior: NoRippleScrollBehaviour(),
                                        child: ListView.builder(
                                            itemCount: types[index]
                                                .biomarkerIds
                                                .length,
                                            itemBuilder: (context, i) {
                                              return BiomarkerItem(
                                                value:
                                                    biomarker.value ?? "null",
                                                unit: biomarker.unit.content
                                                        .shorthand ??
                                                    "unnamed",
                                                id: biomarker.biomarkerId,
                                                withActions: false,
                                              );
                                            })))
                              ],
                            )
                          : Container(
                              child: Text("Биомаркеры ещё не добавлены :("));
                    }),
              ))
          : Container(
              padding: EdgeInsets.only(
                  top: Indents.md, left: Indents.slg, right: Indents.md),
              margin: EdgeInsets.only(bottom: Indents.sm),
              child:
                  Text("Тут пусто. Вы ещё не сдали ни одного биомаркера :(")),
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
            topLeft: Radius.circular(RadiusValues.main),
            topRight: Radius.circular(RadiusValues.main)),
        onPanelSlide: (double pos) => setState(() {
          _fabHeight =
              pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
        }),
      ),
    ]); // This trailin);
  }
}
