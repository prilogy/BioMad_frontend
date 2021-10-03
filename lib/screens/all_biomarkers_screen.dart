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
import 'package:biomad_frontend/widgets/on_load_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AllBiomarkersScreen extends StatefulWidget {
  final List<MemberBiomarker?>? memberBiomarkers;
  final String? categoryName;

  AllBiomarkersScreen({Key? key, this.memberBiomarkers, this.categoryName}) : super(key: key);

  @override
  _AllBiomarkersScreenState createState() => _AllBiomarkersScreenState(memberBiomarkers, categoryName);
}

class _AllBiomarkersScreenState extends State<AllBiomarkersScreen> {
  final List<MemberBiomarker?>? memberBiomarkers;
  final String? categoryName;

  _AllBiomarkersScreenState(this.memberBiomarkers, this.categoryName);

  Future<List<Biomarker>?> getBiomarker() async {
    return await api.biomarker.info();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Biomarker>?> biomarkers = getBiomarker();
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
          title: Text(tr('category.all_view'), style: TextStyle(color: Theme.of(context).primaryColor)),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return false;
          },
          child: Container(
            padding: EdgeInsets.only(left: Indents.md, right: Indents.md),
            margin: EdgeInsets.only(bottom: Indents.sm),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: memberBiomarkers!.length,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                      future: biomarkers,
                      builder: (context, AsyncSnapshot<List<Biomarker>?> biomarkers) {
                        if (biomarkers.hasData) {
                          MemberBiomarker memberBiomarkerItem = memberBiomarkers![index]!;
                          Biomarker biomarkerItem =
                              biomarkers.data!.firstWhere((element) => element.id == memberBiomarkerItem.biomarkerId);
                          return BiomarkerItem(
                            index: index,
                            value: memberBiomarkerItem.value ?? "null" as double?,
                            unit: memberBiomarkerItem.unit!.content!.shorthand ?? "unnamed",
                            unitId: memberBiomarkerItem.unitId,
                            id: memberBiomarkerItem.biomarkerId,
                            biomarkerState: biomarkerItem.state,
                            biomarkerName: biomarkerItem.content!.name,
                            withActions: false,
                          );
                        } else {
                          return OnLoadContainer(
                            index: index,
                            padding: EdgeInsets.zero,
                          );
                        }
                      });
                }),
          ),
        ));
  }
}
