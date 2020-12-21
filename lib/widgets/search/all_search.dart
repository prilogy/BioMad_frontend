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

class AllSearch extends StatefulWidget {
  final String hintText;

  AllSearch(
      {@required this.hintText,
        Key key})
      : super(key: key);

  @override
  _AllSearchState createState() => _AllSearchState(hintText);
}

class _AllSearchState extends State<AllSearch> {
  final String hintText;
  _AllSearchState(this.hintText);

  TextEditingController _searchController = TextEditingController();

  Future<List<Biomarker>> getBiomarkers(
      {String query, bool init = false}) async {
    if (init)
      return await api.biomarker.info();
    else
      return await api.biomarker.search("\"" + query + "\"");
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Biomarker>> biomarkers = getBiomarkers(init: true);
    return FutureBuilder(
        future: biomarkers,
        builder: (context, AsyncSnapshot<List<Biomarker>> biomarkersSnap) {
          return Scaffold(
              appBar: AppBar(
                  title: Container(
                      height: 40,
                      child: TextFormField(
                          autofocus: true,
                          controller: _searchController,
                          onChanged: (val) {
                            biomarkers = getBiomarkers(query: val);
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
                                },
                                icon: Icon(Icons.clear,
                                    color: Theme.of(context).primaryColor),
                              ))))),
              body: biomarkersSnap.hasData
                  ? biomarkersSnap.data.isNotEmpty
                      ? Container(
                          height: MediaQuery.of(context).size.height -
                              AppBar().preferredSize.height -
                              61,
                          child: ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                              padding: EdgeInsets.only(
                                left: Indents.md,
                                right: Indents.md,
                              ),
                              itemCount: biomarkersSnap.data.length,
                              itemBuilder: (context, index) => Container(
                                  child: biomarkerItems(
                                      context, biomarkersSnap.data[index]))))
                      : Container(child: Text("Просто пусто"))
                  : Container(
                      child: Text("Тещу"),
                    ));
        });
  }
}
