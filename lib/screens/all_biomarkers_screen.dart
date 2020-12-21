import 'dart:async';

import 'package:api/api.dart';
import 'package:biomad_frontend/containers/biomarker_container.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_item.dart';
import 'package:flutter/material.dart';

class AllBiomarkersScreen extends StatefulWidget {
  final List<MemberBiomarker> memberBiomarkers;
  final String categoryName;

  AllBiomarkersScreen({Key key, this.memberBiomarkers, this.categoryName}) : super(key: key);

  @override
  _AllBiomarkersScreenState createState() => _AllBiomarkersScreenState(memberBiomarkers, categoryName);
}

class _AllBiomarkersScreenState extends State<AllBiomarkersScreen> {
  final List<MemberBiomarker> memberBiomarkers;
  final String categoryName;

  _AllBiomarkersScreenState(this.memberBiomarkers, this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Keys.rootNavigator.currentState.pushReplacementNamed(
                    Routes.main);
              },
            );
          },
        ),
        title: Text("Просмотр биомаркеров", style: TextStyle(color: Theme.of(context).primaryColor)),
      ),
      body: Container(
        padding: EdgeInsets.only(left: Indents.md, right: Indents.md),
        margin: EdgeInsets.only(bottom: Indents.sm),
        height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
        child: ListView.builder(
            itemCount: memberBiomarkers.length,
            itemBuilder: (context, index) {
              var biomarker = memberBiomarkers[index];
              return BiomarkerItem(
                value: biomarker.value ?? "null",
                unit: biomarker.unit.content.shorthand ?? "unnamed",
                unitId: biomarker.unitId,
                id: biomarker.biomarkerId,
                withActions: false,
              );
            }),
      ),
    );
  }
}
