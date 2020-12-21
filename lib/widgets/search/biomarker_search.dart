import 'dart:async';

import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

import 'biomarker_items.dart';

class BiomarkerSearch extends StatefulWidget {
  final String hintText;

  BiomarkerSearch(
      {@required this.hintText,
        Key key})
      : super(key: key);

  @override
  _BiomarkerSearchState createState() => _BiomarkerSearchState(hintText);
}

class _BiomarkerSearchState extends State<BiomarkerSearch> {
  final String hintText;
  _BiomarkerSearchState(this.hintText);

  TextEditingController _searchController = TextEditingController();

  Future<List<Biomarker>> getBiomarkers(
      {String query, bool init = false}) async {
    if (init)
      return await api.biomarker.info();
    else
      return await api.biomarker.search("\"" + query + "\"");
  }

  StreamController<Future<List<Biomarker>>> searchStream;
  Future<List<Biomarker>> biomarkers;

  void _loadBiomarkers(biomarkers) async => searchStream.add(biomarkers);

  @override
  void initState() {
    searchStream = StreamController<Future<List<Biomarker>>>();
    biomarkers = getBiomarkers(init: true);
    _loadBiomarkers(biomarkers);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Container(
                height: 40,
                child: TextFormField(
                    autofocus: true,
                    controller: _searchController,
                    onChanged: (val) {
                      setState(() {
                        biomarkers = getBiomarkers(query: val);
                        _loadBiomarkers(biomarkers);
                      });
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.5),
                        focusColor: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.5),
                        hoverColor: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.5),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: hintText ?? "Начните набирать",
                        suffixIcon: IconButton(
                          onPressed: () {
                            _searchController.text = "";
                            biomarkers = getBiomarkers(init: true);
                            _loadBiomarkers(biomarkers);
                          },
                          icon: Icon(Icons.clear,
                              color: Theme.of(context).primaryColor),
                        ))))),
        body: StreamBuilder(
            stream: searchStream.stream,
            builder: (context, snap) {
              if (snap.hasData) {
                return FutureBuilder(
                    future: snap.data,
                    builder: (context, AsyncSnapshot<List<Biomarker>> biomarkersSnap) {
                      return biomarkersSnap.hasData
                          ? biomarkersSnap.data.isNotEmpty
                          ? Container(
                          height: MediaQuery.of(context).size.height -
                              AppBar().preferredSize.height -
                              61,
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  Divider(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface,
                                  ),
                              padding: EdgeInsets.only(
                                left: Indents.md,
                                right: Indents.md,
                              ),
                              itemCount: biomarkersSnap.data.length,
                              itemBuilder: (context, index) =>
                                  Container(
                                      child: biomarkerItems(context,
                                          biomarkersSnap.data[index]))))
                          : Container(
                          padding: EdgeInsets.only(
                            left: Indents.md,
                            right: Indents.md,
                          ),
                          child: Text(
                              "Извините, такая единица измерения пока что не добавлена в систему :("))
                          : Container();
                    });
              } else
                return Container();
            }));
  }
}
