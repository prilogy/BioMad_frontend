import 'dart:async';

import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomsSearch extends StatefulWidget {
  final String hintText;
  List<Biomarker>? customBiomarker;

  CustomsSearch({required this.hintText, this.customBiomarker, Key? key}) : super(key: key);

  @override
  _CustomsSearchState createState() => _CustomsSearchState(hintText, customBiomarker);
}

class _CustomsSearchState extends State<CustomsSearch> {
  final String? hintText;
  List<Biomarker>? customBiomarker;

  _CustomsSearchState(this.hintText, this.customBiomarker);

  TextEditingController _searchController = TextEditingController();

  Future<List<Biomarker>?> getBiomarkers({String? query, bool init = false}) async {
    if (init)
      return await api.biomarker.info();
    else
      return await api.biomarker.search("\"" + query! + "\"");
  }

  late StreamController<Future<List<Biomarker>>?> searchStream;
  Future<List<Biomarker>?>? biomarkers;

  void _loadBiomarkers(biomarkers) async => searchStream.add(biomarkers);

  @override
  void initState() {
    searchStream = StreamController<Future<List<Biomarker>>?>();
    biomarkers = getBiomarkers(init: true);
    _loadBiomarkers(biomarkers);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    biomarkers = getBiomarkers(init: true);
    return Scaffold(
        appBar: AppBar(
            title: Container(
                height: 40,
                child: TextFormField(
                    autofocus: true,
                    controller: _searchController,
                    onChanged: (val) {
                      setState(() {
                        if (val == "")
                          biomarkers = getBiomarkers(init: true);
                        else
                          biomarkers = getBiomarkers(query: val);
                        _loadBiomarkers(biomarkers);
                      });
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.background.withOpacity(0.5),
                        focusColor: Theme.of(context).colorScheme.background.withOpacity(0.5),
                        hoverColor: Theme.of(context).colorScheme.background.withOpacity(0.5),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: hintText ?? tr('search.hint'),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _searchController.text = "";
                            biomarkers = getBiomarkers(init: true);
                            _loadBiomarkers(biomarkers);
                          },
                          icon: Icon(Icons.clear, color: Theme.of(context).primaryColor),
                        ))))),
        body: StreamBuilder(
            stream: searchStream.stream,
            builder: (context, snap) {
              if (snap.hasData) {
                return FutureBuilder(
                    future: snap.data as Future<List<Biomarker>>?,
                    builder: (context, AsyncSnapshot<List<Biomarker>> biomarkersSnap) {
                      if (biomarkersSnap.hasData) {
                        return biomarkersSnap.data!.isNotEmpty
                            ? Container(
                                height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 61,
                                child: ListView.separated(
                                    separatorBuilder: (context, index) => Divider(
                                          color: Theme.of(context).colorScheme.onSurface,
                                        ),
                                    padding: EdgeInsets.only(
                                      left: Indents.md,
                                      right: Indents.md,
                                    ),
                                    itemCount: biomarkersSnap.data!.length,
                                    itemBuilder: (context, index) {
                                      bool isAdded;
                                      try {
                                        customBiomarker?.firstWhere(
                                            (element) => element.id == biomarkersSnap.data![index].id,
                                            orElse: null);
                                        isAdded = false;
                                      } catch (e) {
                                        isAdded = false;
                                      }
                                      if (biomarkersSnap.data![index].content != null) {
                                        return isAdded
                                            ? GestureDetector(
                                                behavior: HitTestBehavior.opaque,
                                                onTap: () {
                                                  SnackBarExtension.dark("Нельзя выбрать уже добавленный биомаркер!",
                                                      duration: Duration(seconds: 4));
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(vertical: Indents.sm),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        biomarkersSnap.data![index].content!.name!.length > 40
                                                            ? biomarkersSnap.data![index].content!.name!.substring(0, 38) + "..."
                                                            : biomarkersSnap.data![index].content!.name!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1!
                                                            .merge(TextStyle(color: BioMadColors.base[300], fontWeight: FontWeight.normal)),
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                            : GestureDetector(
                                                behavior: HitTestBehavior.opaque,
                                                onTap: () {
                                                  Navigator.of(context).pop(biomarkersSnap.data![index]);
                                                  //dataList.firstWhere((element) => element.id == data.id)
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(vertical: Indents.sm),
                                                  child: Text(
                                                    biomarkersSnap.data![index].content!.name!.length > 44
                                                        ? biomarkersSnap.data![index].content!.name!.substring(0, 44) + "..."
                                                        : biomarkersSnap.data![index].content!.name!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1!
                                                        .merge(TextStyle(color: BioMadColors.base[500], fontWeight: FontWeight.normal)),
                                                  ),
                                                ));
                                      } else {
                                        return Container(
                                            child: Text("Все биомаркеры:",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .merge(TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.8)))));
                                      }
                                    }))
                            : Container(
                                padding: EdgeInsets.only(
                                  left: Indents.md,
                                  right: Indents.md,
                                ),
                                child: Text("Извините, такой биомаркер пока что не добавлен в систему :("));
                      } else {
                        return Container();
                      }
                    });
              } else
                return Container();
            }));
  }
}
