import 'package:api/api.dart';
import 'package:biomad_frontend/containers/category_container.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_item.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TODO: КООРДИНАЛЬНО ПЕРЕДЕЛАТЬ. ВРЕМЕННАЯ ВЕРСИЯ >
/// Создаёт окно поиска контента
class SearchScreen1 extends StatefulWidget {
  final String hintText;
  final List<dynamic> dataList;
  final SearchResultModel allData;
  final initialValue;
  final searchType;

  SearchScreen1(
      {@required this.hintText,
      this.dataList,
      this.allData,
      this.initialValue = "",
      this.searchType,
      Key key})
      : super(key: key);

  @override
  _SearchScreen1State createState() =>
      _SearchScreen1State(hintText, dataList, allData, initialValue, searchType);
}

class _SearchScreen1State extends State<SearchScreen1> {
  final String hintText;
  List<dynamic> dataList;
  SearchResultModel allData;
  final initialValue;
  final searchType;

  _SearchScreen1State(this.hintText, this.dataList, this.allData,
      this.initialValue, this.searchType);

  List<Widget> mass;
  bool isSearch = false;
  String _query;
  TextEditingController _searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  Future<List<Biomarker>> getBiomarkers(
      {String query, bool init = false}) async {
    if (init)
      return await api.biomarker.info();
    else
      return await api.biomarker.search("\"" + query + "\"");
  }

  Future<List<MemberBiomarker>> getMemberBiomarkers() async {
    return await api.memberBiomarker.info();
  }

  Future<SearchResultModel> getAll({String query, bool init = false}) async {
      return await api.helper.search("\"" + query + "\"");
  }

  Future<List<Unit>> getUnits({String query, bool init = false}) async {
    if (init)
      return store.state.unitList.units;
    else
      return await api.unit.search("\"" + query + "\"");
  }

  @override
  void initState() {
    if (searchType == "biomarker" || searchType == "memberBiomarker")
      getBiomarkers(init: true).then((x) => {
            setState(() {
              dataList = x;
            })
          });
    else if (searchType == "unit")
      getUnits(init: true).then((x) => {
            setState(() {
              dataList = x;
            })
          });
    else
      getAll(init: true).then((x) => {
            setState(() {
              allData = x;
            })
          });
    _searchController.text = initialValue;
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
                      if (searchType == "biomarker" ||
                          searchType == "memberBiomarker")
                        getBiomarkers(query: val).then((x) => {
                              setState(() {
                                dataList = x;
                              })
                            });
                      else if (searchType == "unit")
                        getUnits(query: val).then((x) => {
                              setState(() {
                                dataList = x;
                              })
                            });
                      else
                        getAll(query: val).then((x) => {
                              setState(() {
                                allData = x;
                              })
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
                            setState(() {
                              if (searchType == "biomarker" ||
                                  searchType == "memberBiomarker")
                                getBiomarkers(query: "", init: true).then((x) => {
                                      setState(() {
                                        dataList = x;
                                      })
                                    });
                              else if (searchType == "unit")
                                dataList = store.state.unitList.units;
                              else {
                                allData = null;
                                dataList = null;
                              }
                            });
                          },
                          icon: Icon(Icons.clear,
                              color: Theme.of(context).primaryColor),
                        ))))),
        body: Container(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                61,
            child: dataList != null
                ? ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                    padding: EdgeInsets.only(
                      left: Indents.md,
                      right: Indents.md,
                    ),
                    itemCount: dataList.length,
                    itemBuilder: (context, index) => Container(
                        child: searchType == "biomarker"
                            ? _biomarkerItems(context, dataList[index])
                            : searchType == "unit"
                                ? _unitItems(context, dataList[index])
                                : searchType == "memberBiomarker"
                                    ? _memberBiomarkerItem(
                                        context, dataList[index])
                                    : Text("Тип поиска не определен :(")))
                : allData != null
                    ? _allItems(context, allData)
                    : Container(
                        padding: EdgeInsets.only(
                            top: Indents.sm,
                            left: Indents.md,
                            right: Indents.md),
                        margin: EdgeInsets.only(bottom: Indents.sm),
                        child: Text("Совпадений не найдено :("))));
  }

  Widget _allItems(BuildContext context, SearchResultModel data) {
    List<MemberBiomarker> memberBiomarker;
    getMemberBiomarkers().then((x) => {
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
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .merge(TextStyle(color: Theme.of(context).primaryColor)),
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
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .merge(TextStyle(color: Theme.of(context).primaryColor)),
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

  Widget _memberBiomarkerItem(BuildContext context, Biomarker data) {
    List<MemberBiomarker> memberBiomarkers;
    getMemberBiomarkers().then((x) => {
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

  Widget _biomarkerItems(BuildContext context, Biomarker data) {
    bool isAdded;
    try {
      store.state.memberBiomarkerModelList.biomarkers?.firstWhere(
          (element) => element.biomarkerId == data.id,
          orElse: null);
      isAdded = true;
    } catch (e) {
      isAdded = false;
    }
    return isAdded
        ? GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              SnackBarExtension.dark(
                  "Нельзя выбрать уже добавленный биомаркер!",
                  duration: Duration(seconds: 4));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Indents.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.content.name,
                    style: Theme.of(context).textTheme.bodyText2.merge(
                        TextStyle(
                            color: Theme.of(context).colorScheme.onSurface)),
                  ),
                  Text(
                    ("(добавлен)"),
                    style: Theme.of(context).textTheme.bodyText2.merge(
                        TextStyle(
                            color: Theme.of(context).colorScheme.onSurface)),
                  ),
                ],
              ),
            ))
        : GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context)
                  .pop(dataList.firstWhere((element) => element.id == data.id));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Indents.sm),
              child: Text(
                data.content.name,
                style: Theme.of(context).textTheme.bodyText2.merge(
                    TextStyle(color: Theme.of(context).colorScheme.onSurface)),
              ),
            ));
  }

  Widget _unitItems(BuildContext context, data) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context)
              .pop(dataList.firstWhere((element) => element.id == data.id));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Indents.sm),
          child: Text(
            data.content.name,
            style: Theme.of(context).textTheme.bodyText2.merge(
                TextStyle(color: Theme.of(context).colorScheme.onSurface)),
          ),
        ));
  }
}

class CategoryBlock extends StatelessWidget {
  final List<Widget> cards;
  final String header;
  final bool grid;

  const CategoryBlock({Key key, this.cards, this.header, this.grid = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!grid)
      return BlockBaseWidget(
        header: header,
        child: Column(children: cards),
      );
    else {
      return BlockBaseWidget(
        header: header,
        child: GridView.count(
          primary: false,
          crossAxisSpacing: Indents.md,
          mainAxisSpacing: Indents.md,
          childAspectRatio: 16 / 9,
          shrinkWrap: true,
          crossAxisCount: 2,
          children: cards,
        ),
      );
    }
  }
}

/// Создаёт строку с поисковой подсказкой
class SearchHint extends StatelessWidget {
  /// Текст подсказки
  final String text;

  /// Функция, которая должна выполняться по нажатию на строку
  final Function onPressed;

  /// Функция, которая должна выполняться по нажатию на стрелку (иконка справа)
  final Function onIconTap;

  const SearchHint(
      {Key key,
      @required this.text,
      @required this.onPressed,
      @required this.onIconTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: InkWell(
        child: Icon(Icons.search),
        onTap: onIconTap,
      ),
      title: InkWell(
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: false,
        ),
        onTap: onIconTap,
      ),
      trailing: IconButton(
        icon: Icon(Icons.arrow_upward),
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
        onPressed: onPressed,
      ),
    );
  }
}
