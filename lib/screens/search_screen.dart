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
  final List<int> unitIds;
  final SearchResultModel allData;
  final initialValue;
  final searchType;

  SearchScreen({@required this.hintText,
    this.dataList,
    this.unitIds,
    this.allData,
    this.initialValue = "",
    this.searchType,
    Key key})
      : super(key: key);

  @override
  _SearchScreenState createState() =>
      _SearchScreenState(hintText, dataList, unitIds, allData, initialValue, searchType);
}

class _SearchScreenState extends State<SearchScreen> {
  final String hintText;
  List<dynamic> dataList;
  final List<int> unitIds;
  SearchResultModel allData;
  final initialValue;
  final searchType;

  _SearchScreenState(this.hintText, this.dataList, this.unitIds, this.allData,
      this.initialValue, this.searchType);

  TextEditingController _searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

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
      return UnitSearch(hintText: hintText, unitIds: unitIds);
    else
      return AllSearch(hintText: hintText,);
  }


}