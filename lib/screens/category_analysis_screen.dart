import 'package:biomad_frontend/containers/category_analysis_container.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:flutter/material.dart';

class CategoryAnalysisScreen extends StatefulWidget {
  final int categoryId;

  CategoryAnalysisScreen({Key key, this.categoryId}) : super(key: key);

  @override
  _CategoryAnalysisScreenState createState() =>
      _CategoryAnalysisScreenState(categoryId);
}

class _CategoryAnalysisScreenState extends State<CategoryAnalysisScreen> {
  final int categoryId;

  _CategoryAnalysisScreenState(this.categoryId);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var category = store.state.categoryList.categories
        .firstWhere((element) => element.id == categoryId);

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Keys.rootNavigator.currentState
                    .pushReplacementNamed(Routes.main);
              },
            );
          },
        ),
        title: Text(category.content.name,
            style: TextStyle(color: Theme.of(context).primaryColor)),
      ),
      body: CategoryAnalysisContainer(categoryId: categoryId,),
    );
  }
}
