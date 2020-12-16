import 'dart:async';

import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/get_state.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/category_list.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/category_item.dart';
import 'package:biomad_frontend/widgets/on_load_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CategoryContainer extends StatefulWidget {
  @override
  _CategoryContainerState createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  Future<List<Category>> getCategories() async {
    return await api.category.info();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Category>> categories = getCategories();
    return Container(
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            61,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: categories,
            builder: (context, AsyncSnapshot<List<Category>> categories) {
              if (categories.hasData) {
                return ScrollConfiguration(
                    behavior: NoRippleScrollBehaviour(),
                    child: ListView.builder(
                        itemCount: categories.data.length,
                        itemBuilder: (context, index) => CategoryItem(
                            index: index, category: categories.data[index])));
              } else {
                return Container(
                    padding:
                        EdgeInsets.only(top: Indents.md, left: Indents.slg),
                    child: Text("Категории загружаются..."));
              }
            }));
  }
}
