import 'package:biomad_frontend/containers/account_container.dart';
import 'package:biomad_frontend/containers/analysis_list_container.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/nav_bar.dart';
import 'package:biomad_frontend/widgets/nav_top_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AnalysisListScreen extends StatefulWidget {
  final int index;

  AnalysisListScreen({Key key, this.index}) : super(key: key);

  @override
  _AnalysisListScreenState createState() => _AnalysisListScreenState(index);
}

class _AnalysisListScreenState extends State<AnalysisListScreen> {
  int index = 1;

  _AnalysisListScreenState(this.index);

  PanelController _panelController = PanelController();

  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen = 500;
  double _panelHeightClosed = 0;

  @override
  Widget build(BuildContext context) {
    store.dispatch(StoreThunks.refreshMemberAnalysis());

    return Scaffold(
      appBar: AppBar(
        title: NavTopBar(index: 1),
      ),
      body: Stack(children: [
        Scaffold(
            body: Container(
                //tmpBiomarker(context)
                child: Column(
                  children: [AnalysisListContainer()],
                ))),
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
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
