import 'package:biomad_frontend/containers/account_container.dart';
import 'package:biomad_frontend/containers/category_container.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/biomarker_list.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/nav_bar.dart';
import 'package:biomad_frontend/widgets/nav_page_bar.dart';
import 'package:biomad_frontend/widgets/nav_top_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'biomarker_list_screen.dart';

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

  List<String> navPageBar = ["Моё здоровье", "Биомаркеры"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    store.dispatch(StoreThunks.refreshTypes());

    return Scaffold(
      appBar: AppBar(
        title: NavTopBar(index: 0),
      ),
      body: Stack(children: [
        Scaffold(
            body: Container(
                child: Column(
                  children: [
                    SizedBox(
                        height: 25,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: navPageBar.length,
                            itemBuilder: (context, index) =>
                                buildNavTopBar(index))),
                    selectedIndex == 0
                        ? CategoryContainer()
                        : BioMarkerListScreen()
                  ],
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

  Widget buildNavTopBar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: index == 0
            ? EdgeInsets.only(left: Indents.slg, right: Indents.md)
            : EdgeInsets.symmetric(horizontal: Indents.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              navPageBar[index],
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: selectedIndex == index
                      ? BioMadColors.base
                      : BioMadColors.base.withOpacity(0.7)),
            ),
            Container(
                margin: EdgeInsets.only(top: Indents.sm),
                height: 2,
                width: 40,
                color: selectedIndex == index
                    ? BioMadColors.primary
                    : Colors.transparent),
          ],
        ),
      ),
    );
  }
}
