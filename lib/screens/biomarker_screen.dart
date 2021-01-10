import 'package:api/api.dart';
import 'package:biomad_frontend/containers/biomarker_container.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/indents.dart';
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

  Future<List<Biomarker>> getBiomarker() async {
    return await api.biomarker.info();
  }

  Future<List<MemberBiomarker>> getMemberBiomarker() async {
    return await api.memberBiomarker.info();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<MemberBiomarker>> memberBiomarkers = getMemberBiomarker();
    Future<List<Biomarker>> biomarkers = getBiomarker();

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
        title: FutureBuilder(
            future: biomarkers,
            builder: (context, AsyncSnapshot<List<Biomarker>> biomarkers) {
              if (biomarkers.hasData) {
                biomarker = biomarkers.data.firstWhere((element) => element.id == biomarkerId);
                return Text(biomarker.content.name, style: TextStyle(color: Theme.of(context).primaryColor));
              } else {
                return Text("Загрузка биомаркера...");
              }
            }),
      ),
      body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return false;
          },
          child: ListView(children: [
            FutureBuilder(
                future: memberBiomarkers,
                builder: (context, AsyncSnapshot<List<MemberBiomarker>> memberBiomarkers) {
                  if (memberBiomarkers.hasData) {
                    memberBiomarker = memberBiomarkers.data.firstWhere((element) => element.biomarkerId == biomarkerId);
                    return BiomarkerContainer(memberBiomarker: memberBiomarker);
                  } else {
                    return Container(
                        padding: EdgeInsets.only(left: Indents.md, right: Indents.md),
                        margin: EdgeInsets.only(bottom: Indents.sm),
                        child: Text("Ожидаем загрузки биомаркера"));
                  }
                })
          ])),
    );
  }
}
