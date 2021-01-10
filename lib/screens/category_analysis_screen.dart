import 'package:api/api.dart';
import 'package:biomad_frontend/containers/category_analysis_container.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:flutter/material.dart';

class CategoryAnalysisScreen extends StatefulWidget {
  final Category category;

  CategoryAnalysisScreen({Key key, this.category}) : super(key: key);

  @override
  _CategoryAnalysisScreenState createState() => _CategoryAnalysisScreenState(category);
}

class _CategoryAnalysisScreenState extends State<CategoryAnalysisScreen> {
  final Category category;

  _CategoryAnalysisScreenState(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Keys.rootNavigator.currentState.pushReplacementNamed(Routes.main);
                },
              );
            },
          ),
          title: Text(category.content.name, style: TextStyle(color: Theme.of(context).primaryColor)),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Keys.rootNavigator.currentState.pushReplacementNamed(Routes.main);
            return false;
          },
          child: CategoryAnalysisContainer(
            category: category,
          ),
        ));
  }
}
