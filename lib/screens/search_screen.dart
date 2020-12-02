import 'package:api/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TODO: КООРДИНАЛЬНО ПЕРЕДЕЛАТЬ. ВРЕМЕННАЯ ВЕРСИЯ >
/// Создаёт окно поиска контента
class SearchScreen extends StatefulWidget {
  final String hintText;
  final List<dynamic> dataList;
  final initialValue;
  final searchType;

  SearchScreen(
      {@required this.hintText,
      this.dataList,
      this.initialValue,
      this.searchType,
      Key key})
      : super(key: key);

  @override
  _SearchScreenState createState() =>
      _SearchScreenState(hintText, dataList, initialValue, searchType);
}

class _SearchScreenState extends State<SearchScreen> {
  final String hintText;
  final List<dynamic> dataList;
  final initialValue;
  final searchType;

  _SearchScreenState(
      this.hintText, this.dataList, this.initialValue, this.searchType);

  List<Widget> mass;
  bool isSearch = false;
  String _query;
  TextEditingController _searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Container(
                height: 40,
                child: TextFormField(
                    autofocus: true,
                    initialValue: initialValue,
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
                          onPressed: () {},
                          icon: Icon(Icons.clear,
                              color: Theme.of(context).primaryColor),
                        ))))),
        body: dataList != null
            ? ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                padding: EdgeInsets.only(left: Indents.md, right: Indents.md),
                itemCount: dataList.length,
                itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.symmetric(vertical: Indents.sm),
                    child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.of(context).pop(dataList.firstWhere(
                              (element) => element.id == dataList[index].id));
                        },
                        child: searchType == "biomarker"
                            ? _biomarkerItems(context, index)
                            : searchType == "unit"
                                ? _unitItems(context, index)
                                : Text("Тип поиска не определен :("))))
            : Container());
  }

  Widget _biomarkerItems(BuildContext context, index) {
    return Text(
      dataList[index].content.name,
      style: Theme.of(context)
          .textTheme
          .bodyText2
          .merge(TextStyle(color: Theme.of(context).colorScheme.onSurface)),
    );
  }

  Widget _unitItems(BuildContext context, index) {
    return Text(
      store.state.unitList.units[index].content.name,
      style: Theme.of(context)
          .textTheme
          .bodyText2
          .merge(TextStyle(color: Theme.of(context).colorScheme.onSurface)),
    );
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
