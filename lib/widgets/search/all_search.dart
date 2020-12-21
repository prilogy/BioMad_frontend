import 'dart:async';

import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_item.dart';
import 'package:flutter/material.dart';

import '../category_item.dart';
import 'biomarker_items.dart';

class AllSearch extends StatefulWidget {
  final String hintText;

  AllSearch({@required this.hintText, Key key}) : super(key: key);

  @override
  _AllSearchState createState() => _AllSearchState(hintText);
}

class _AllSearchState extends State<AllSearch> {
  final String hintText;

  _AllSearchState(this.hintText);

  TextEditingController _searchController = TextEditingController();

  Future<SearchResultModel> getSearch(String query) async {
    return await api.helper.search("\"" + query + "\"");
  }

  StreamController<Future<SearchResultModel>> searchStream;
  Future<SearchResultModel> searchData;

  void _loadBiomarkers(biomarkers) async => searchStream.add(biomarkers);

  Future<List<MemberBiomarker>> getMemberBiomarkers() async {
    return await api.memberBiomarker.info();
  }

  @override
  void initState() {
    searchStream = StreamController<Future<SearchResultModel>>();
    searchData = getSearch("");
    _loadBiomarkers(searchData);
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
                        searchData = getSearch(val);
                        _loadBiomarkers(searchData);
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
                        hintText: hintText ?? "Начните набирать",
                        suffixIcon: IconButton(
                          onPressed: () {
                            _searchController.text = "";
                            searchData = getSearch("");
                            _loadBiomarkers(searchData);
                          },
                          icon: Icon(Icons.clear, color: Theme.of(context).primaryColor),
                        ))))),
        body: StreamBuilder(
            stream: searchStream.stream,
            builder: (context, snap) {
              if (snap.hasData) {
                return FutureBuilder(
                    future: snap.data,
                    builder: (context, AsyncSnapshot<SearchResultModel> searchSnap) {
                      return searchSnap.hasData
                          ? searchSnap.data != null
                              ? Column(children: [
                                  searchSnap.data.categories.isNotEmpty
                                      ? _categoryList(context, searchSnap.data.categories)
                                      : Container(),
                                  searchSnap.data.biomarkers.isNotEmpty
                                      ? _memberBiomarkerList(context, searchSnap.data.biomarkers)
                                      : Container(),
                                ])
                              : Container(
                                  padding: EdgeInsets.only(
                                    left: Indents.md,
                                    right: Indents.md,
                                  ),
                                  child: Text("Извините, мы не смогли ничего найти :("))
                          : Container();
                    });
              } else
                return Container();
            }));
  }

  Widget _categoryList(BuildContext context, List<Category> data) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: Indents.md, right: Indents.md),
            child: Text(
              "Категории",
              style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ),
          Container(
              height: data.length * 76.0,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => CategoryItem(index: index, category: data[index]))),
        ],
      ),
    );
  }

  Widget _memberBiomarkerList(BuildContext context, List<Biomarker> data) {
    Future<List<MemberBiomarker>> memberBiomarkers = getMemberBiomarkers();

    return FutureBuilder(
        future: memberBiomarkers,
        builder: (context, AsyncSnapshot<List<MemberBiomarker>> memberBiomarkersSnap) {
          if (memberBiomarkersSnap.hasData) {
            List<MemberBiomarker> memberBiomarker = [];
            for (var item in data) {
              try {
                MemberBiomarker memberBiomarkerItem =
                    memberBiomarkersSnap.data.firstWhere((element) => element.biomarkerId == item.id);
                memberBiomarker.add(memberBiomarkerItem);
                print(memberBiomarkerItem);
              } catch (e) {}
            }
            return Container(
              padding: EdgeInsets.only(top: Indents.sm, left: Indents.md, right: Indents.md),
              margin: EdgeInsets.only(bottom: Indents.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: Indents.sm),
                    child: Text(
                      "Биомаркеры",
                      style:
                          Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  memberBiomarker.isNotEmpty
                      ? Container(
                          height: memberBiomarker.length * 76.0,
                          child: ListView.builder(
                              itemCount: memberBiomarker.length,
                              itemBuilder: (context, index) {
                                return BiomarkerItem(
                                  value: memberBiomarker[index].value ?? "null",
                                  unit: memberBiomarker[index].unit.content.shorthand ?? "unnamed",
                                  unitId: memberBiomarker[index].unitId,
                                  id: memberBiomarker[index].biomarkerId,
                                  withActions: false,
                                );
                              }))
                      : Container(
                          width: MediaQuery.of(context).size.width - 2 * Indents.md,
                          child: Text("Вы ещё не сдали этот биомаркер."),
                        ),
                ],
              ),
            );
          } else {
            return Container(child: Text("Ожидаем"));
          }
        });
  }
}
