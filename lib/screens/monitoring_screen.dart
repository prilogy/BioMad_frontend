import 'package:biomad_frontend/containers/account_container.dart';
import 'package:biomad_frontend/containers/category_container.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/search_screen.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/biomarker_alert.dart';
import 'package:biomad_frontend/widgets/biomarker_form_field.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom_circle_avatar.dart';
import 'package:biomad_frontend/widgets/custom_divider.dart';
import 'package:biomad_frontend/widgets/custom_list_tile.dart';
import 'package:biomad_frontend/widgets/custom_text_form_field.dart';
import 'package:biomad_frontend/widgets/nav_bar.dart';
import 'package:biomad_frontend/widgets/nav_page_bar.dart';
import 'package:biomad_frontend/widgets/nav_top_bar.dart';
import 'package:biomad_frontend/widgets/tmp_biomarker_buttons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:biomad_frontend/helpers/custom_alert_dialog.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PanelController _panelController = PanelController();

  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen = 500;
  double _panelHeightClosed = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: NavTopBar(),
      ),
      body: Stack(children: [
        Scaffold(
            body: Container(
                //tmpBiomarker(context)
                child: Column(
          children: [NavPageBar(), CategoryContainer()],
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