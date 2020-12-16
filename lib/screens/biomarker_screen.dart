import 'package:api/api.dart';
import 'package:biomad_frontend/containers/biomarker_container.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:flutter/material.dart';

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
