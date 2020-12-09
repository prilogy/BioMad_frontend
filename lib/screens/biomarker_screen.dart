import 'package:api/api.dart';
import 'package:biomad_frontend/containers/biomarker_container.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/custom_circle_avatar.dart';
import 'package:biomad_frontend/widgets/custom_divider.dart';
import 'package:biomad_frontend/widgets/custom_list_tile.dart';
import 'package:biomad_frontend/widgets/nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BioMarkerScreen extends StatefulWidget {
  final int biomarkerId;

  BioMarkerScreen({Key key, this.biomarkerId}) : super(key: key);

  @override
  _BioMarkerScreenState createState() => _BioMarkerScreenState(biomarkerId);
}

class _BioMarkerScreenState extends State<BioMarkerScreen> {
  final int biomarkerId;

  _BioMarkerScreenState(this.biomarkerId);

  MemberBiomarker memberBiomarker;
  Biomarker biomarker;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    memberBiomarker = store.state.memberBiomarkerList.biomarkers
        .firstWhere((element) => element.biomarkerId == biomarkerId);
    biomarker = store.state.biomarkerList.biomarkers
        .firstWhere((element) => element.id == biomarkerId);

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        title: Text(biomarker.content.name,
            style: TextStyle(color: Theme
                .of(context)
                .primaryColor)),
      ),
      body: ListView(children: [BiomarkerContainer(memberBiomarker: memberBiomarker)]),
    );
  }
}
