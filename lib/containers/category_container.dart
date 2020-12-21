import 'dart:async';

import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/get_state.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/category_list.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/category_item.dart';
import 'package:biomad_frontend/widgets/nav_bar.dart';
import 'package:biomad_frontend/widgets/on_load_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'account_container.dart';

class CategoryContainer extends StatefulWidget {
  @override
  _CategoryContainerState createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  PanelController _panelController = PanelController();

  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen = 500;
  double _panelHeightClosed = 0;

  Future<List<Category>> getCategories() async {
    return await api.category.info();
  }

  Future<List<Category>> categories;

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            61,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          FutureBuilder(
              future: categories,
              builder: (context, AsyncSnapshot<List<Category>> categories) {
                if (categories.hasData) {
                  return ScrollConfiguration(
                      behavior: NoRippleScrollBehaviour(),
                      child: ListView.builder(
                          itemCount: categories.data.length,
                          itemBuilder: (context, index) => CategoryItem(
                              index: index, category: categories.data[index])));
                } else {
                  return ScrollConfiguration(
                      behavior: NoRippleScrollBehaviour(),
                      child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) => OnLoadContainer(
                                index: index,
                              )));
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
                topLeft: Radius.circular(RadiusValues.main),
                topRight: Radius.circular(RadiusValues.main)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
        ]));
  }
}
