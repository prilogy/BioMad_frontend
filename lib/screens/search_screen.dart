import 'package:api/api.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/widgets/search/all_search.dart';
import 'package:biomad_frontend/widgets/search/biomarker_search.dart';
import 'package:biomad_frontend/widgets/search/customs_search.dart';
import 'package:biomad_frontend/widgets/search/unit_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TODO: КООРДИНАЛЬНО ПЕРЕДЕЛАТЬ. ВРЕМЕННАЯ ВЕРСИЯ >
/// Создаёт окно поиска контента
class SearchScreen extends StatefulWidget {
  final String hintText;
  final List<dynamic>? dataList;
  final List<int>? unitIds;
  final SearchResultModel? allData;
  final initialValue;
  final searchType;
  List<Biomarker>? customBiomarker;

  SearchScreen(
      {required this.hintText,
      this.dataList,
      this.unitIds,
      this.allData,
      this.initialValue = "",
      this.searchType,
      this.customBiomarker,
      Key? key})
      : super(key: key);

  @override
  _SearchScreenState createState() =>
      _SearchScreenState(hintText, dataList, unitIds, allData, initialValue, searchType, customBiomarker);
}

class _SearchScreenState extends State<SearchScreen> {
  final String hintText;
  List<dynamic>? dataList;
  final List<int>? unitIds;
  SearchResultModel? allData;
  final initialValue;
  final searchType;
  List<Biomarker>? customBiomarker;

  _SearchScreenState(
      this.hintText, this.dataList, this.unitIds, this.allData, this.initialValue, this.searchType, this.customBiomarker);

  TextEditingController _searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  Future<SearchResultModel?> getAll({required String query, bool init = false}) async {
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
      return WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return false;
          },
          child: BiomarkerSearch(
            hintText: hintText,
          ));
    else if (searchType == "unit")
      return WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return false;
          },
          child: UnitSearch(hintText: hintText, unitIds: unitIds));
    else if (searchType == "customs")
      return WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return false;
          },
          child: CustomsSearch(hintText: hintText, customBiomarker: customBiomarker));
    else
      return WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return false;
          },
          child: AllSearch(
            hintText: hintText,
          ));
  }
}
