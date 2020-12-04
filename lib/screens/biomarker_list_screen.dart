import 'package:api/api.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var types = store.state.biomarkerTypeList.types;
    types.removeWhere((value) => value.content == null);

    var memberBiomarkerList = store.state.memberBiomarkerList.biomarkers;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Keys.rootNavigator.currentState
                    .pushReplacementNamed(Routes.main);
              },
            );
          },
        ),
        title: Text("Последние биомаркеры",
            style: TextStyle(color: Theme.of(context).primaryColor)),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
              top: Indents.md, left: Indents.md, right: Indents.md),
          margin: EdgeInsets.only(bottom: Indents.sm),
          child: ScrollConfiguration(
            behavior: NoRippleScrollBehaviour(),
            child: ListView.builder(
                itemCount: types.length,
                itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(types[index].content.name,
                            style: theme.textTheme.subtitle1
                                .merge(TextStyle(fontWeight: FontWeight.normal))),
                        Container(
                            height: 76 *
                                types[index].biomarkerIds.length.toDouble(),
                            width: MediaQuery.of(context).size.width,
                            child: ScrollConfiguration(
                              behavior: NoRippleScrollBehaviour(),
                              child: ListView.builder(
                                  itemCount: types[index].biomarkerIds.length,
                                  itemBuilder: (context, index) =>
                                      BiomarkerItem(
                                        status: "<status>",
                                        biomarker: memberBiomarkerList
                                            .firstWhere((x) =>
                                                x.biomarker.id ==
                                                types[index]
                                                    .biomarkerIds[index]),
                                        withActions: false,
                                      )),
                            ))
                      ],
                    )),
          )),
    );
  }
}
