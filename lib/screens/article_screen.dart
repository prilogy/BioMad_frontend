import 'package:api/api.dart';
import 'package:biomad_frontend/containers/biomarker_container.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  final Article article;

  ArticleScreen({Key key, this.article}) : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState(article);
}

class _ArticleScreenState extends State<ArticleScreen> {
  final Article article;

  _ArticleScreenState(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );
            },
          ),
          title: Text(article.content.name, style: TextStyle(color: Theme.of(context).primaryColor))),
      body: ListView(children: [
        BlockBaseWidget(child: Text(article.content.text)),
      ]),
    );
  }
}
