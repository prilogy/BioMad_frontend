import 'package:api/api.dart';
import 'package:biomad_frontend/containers/category_container.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_item.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/category_item.dart';
import 'package:biomad_frontend/widgets/search/all_search.dart';
import 'package:biomad_frontend/widgets/search/biomarker_search.dart';
import 'package:biomad_frontend/widgets/search/unit_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TODO: КООРДИНАЛЬНО ПЕРЕДЕЛАТЬ. ВРЕМЕННАЯ ВЕРСИЯ >
/// Создаёт окно поиска контента
class SearchScreen extends StatefulWidget {
  final String hintText;
  final List<dynamic> dataList;
  final SearchResultModel allData;
  final initialValue;
  final searchType;

  SearchScreen({@required this.hintText,
    this.dataList,
    this.allData,
    this.initialValue = "",
    this.searchType,
    Key key})
      : super(key: key);

  @override
  _SearchScreenState createState() =>
      _SearchScreenState(hintText, dataList, allData, initialValue, searchType);
}

class _SearchScreenState extends State<SearchScreen> {
  final String hintText;
  List<dynamic> dataList;
  SearchResultModel allData;
  final initialValue;
  final searchType;

  _SearchScreenState(this.hintText, this.dataList, this.allData,
      this.initialValue, this.searchType);

  TextEditingController _searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  Future<List<MemberBiomarker>> getMemberBiomarkers() async {
    return await api.memberBiomarker.info();
  }

  Future<SearchResultModel> getAll({String query, bool init = false}) async {
    return await api.helper.search("\"" + query + "\"");
  }

  @override
  void initState() {
    _searchController.text = initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (searchType == "biomarker" || searchType == "memberBiomarker")
      return BiomarkerSearch(hintText: hintText,);
    else if (searchType == "unit")
      return UnitSearch(hintText: hintText,);
    else
      return AllSearch(hintText: hintText,);
  }

  Widget _allItems(BuildContext context, SearchResultModel data) {
    List<MemberBiomarker> memberBiomarker;
    getMemberBiomarkers().then((x) =>
    {
      setState(() {
        memberBiomarker = x;
      })
    });
    return Column(children: [
      data.biomarkers.isNotEmpty && memberBiomarker.isNotEmpty
          ? _memberBiomarkerList(context, data.biomarkers)
          : Container(),
      data.categories.isNotEmpty
          ? _categoryList(context, data.categories)
          : Container(),
    ]);
  }

  Widget _categoryList(BuildContext context, List<Category> data) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: Indents.sm),
            padding: EdgeInsets.only(left: Indents.md, right: Indents.md),
            child: Text(
              "Категории",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6
                  .merge(TextStyle(color: Theme
                  .of(context)
                  .primaryColor)),
            ),
          ),
          Container(
              height: data.length * 76.0,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      CategoryItem(index: index, category: data[index]))),
        ],
      ),
    );
  }

  Widget _memberBiomarkerList(BuildContext context, List<Biomarker> data) {
    return Container(
      padding:
      EdgeInsets.only(top: Indents.sm, left: Indents.md, right: Indents.md),
      margin: EdgeInsets.only(bottom: Indents.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: Indents.sm),
            child: Text(
              "Биомаркеры",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6
                  .merge(TextStyle(color: Theme
                  .of(context)
                  .primaryColor)),
            ),
          ),
          Container(
              height: data.length * 76.0,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      _memberBiomarkerItem(context, data[index]))),
        ],
      ),
    );
  }

  Widget _memberBiomarkerItem(BuildContext context, Biomarker data) {
    List<MemberBiomarker> memberBiomarkers;
    getMemberBiomarkers().then((x) =>
    {
      setState(() {
        memberBiomarkers = x;
      })
    });
    MemberBiomarker memberBiomarker = memberBiomarkers
        .firstWhere((element) => element.biomarkerId == data.id);
    return BiomarkerItem(
      value: memberBiomarker.value ?? "null",
      unit: memberBiomarker.unit.content.shorthand ?? "unnamed",
      unitId: memberBiomarker.unitId,
      id: memberBiomarker.biomarkerId,
      withActions: false,
    );
  }
}