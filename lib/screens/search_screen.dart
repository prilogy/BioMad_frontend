import 'package:biomad_frontend/containers/account_container.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/biomarker_alert.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom_circle_avatar.dart';
import 'package:biomad_frontend/widgets/custom_divider.dart';
import 'package:biomad_frontend/widgets/custom_list_tile.dart';
import 'package:biomad_frontend/widgets/custom_text_form_field.dart';
import 'package:biomad_frontend/widgets/nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:biomad_frontend/helpers/custom_alert_dialog.dart';
//TODO: КООРДИНАЛЬНО ПЕРЕДЕЛАТЬ. ВРЕМЕННАЯ ВЕРСИЯ >
/// Создаёт окно поиска контента
class SearchScreen extends StatefulWidget {
  final String hintText;

  SearchScreen({@required this.hintText, Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState(hintText);
}

class _SearchScreenState extends State<SearchScreen> {
  final String hintText;

  _SearchScreenState(this.hintText);

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
                child: TextField(
                    autofocus: true,
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
                        ))))));
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
