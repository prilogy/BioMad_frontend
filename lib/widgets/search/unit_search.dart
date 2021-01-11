import 'dart:async';

import 'package:api/api.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/search/unit_items.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UnitSearch extends StatefulWidget {
  final String hintText;
  final List<int> unitIds;

  UnitSearch({@required this.hintText, this.unitIds, Key key})
      : super(key: key);

  @override
  _UnitSearchState createState() => _UnitSearchState(hintText, unitIds);
}

class _UnitSearchState extends State<UnitSearch> {
  final String hintText;
  final List<int> unitIds;

  _UnitSearchState(this.hintText, this.unitIds);

  TextEditingController _searchController = TextEditingController();

  Future<List<Unit>> getUnits({String query, bool init = false}) async {
    if (init)
      return store.state.unitList.units;
    else
      return await api.unit.search("\"" + query + "\"");
  }

  StreamController<Future<List<Unit>>> searchStream;
  Future<List<Unit>> units;

  void _loadUnits(units) async => searchStream.add(units);

  @override
  void initState() {
    searchStream = StreamController<Future<List<Unit>>>();
    units = getUnits(init: true);
    _loadUnits(units);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    units = getUnits(init: true);
    return Scaffold(
        appBar: AppBar(
            title: Container(
                height: 40,
                child: TextFormField(
                    autofocus: true,
                    controller: _searchController,
                    onChanged: (val) {
                      setState(() {
                        units = getUnits(query: val);
                        _loadUnits(units);
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
                        hintText: hintText ?? tr('search.hint'),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _searchController.text = "";
                            units = getUnits(init: true);
                            _loadUnits(units);
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
                    builder: (context, AsyncSnapshot<List<Unit>> unitsSnap) {
                      if (unitsSnap.hasData) {
                        if (unitsSnap.data.isNotEmpty) {
                          List<Unit> unitList = [];
                          for (var unit in unitsSnap.data)
                            for (var unitId in unitIds)
                              if (unitId == unit.id) unitList.add(unit);
                          return Container(
                              height: MediaQuery.of(context).size.height -
                                  AppBar().preferredSize.height -
                                  61,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) => Divider(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                  padding: EdgeInsets.only(
                                    left: Indents.md,
                                    right: Indents.md,
                                  ),
                                  itemCount: unitList.length,
                                  itemBuilder: (context, index) => Container(
                                      child: unitItems(
                                          context, unitList[index]))));
                        } else {
                          return Container(
                              padding: EdgeInsets.only(
                                left: Indents.md,
                                right: Indents.md,
                              ),
                              child: Text(
                                  "Извините, такая единица измерения пока что не добавлена в систему :("));
                        }
                      } else {
                        return Container();
                      }
                    });
              } else
                return Container();
            }));
  }
}
