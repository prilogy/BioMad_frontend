import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/article_screen.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

import 'biomarker_alert.dart';
import '../drop_text.dart';

// ignore: must_be_immutable
class BiomarkerInfo extends StatelessWidget {
  final Biomarker biomarker;
  final String title;

  BiomarkerInfo({
    this.biomarker,
    this.title,
  });

  BiomarkerInfo.forScrollingViews({
    this.biomarker,
    this.title,
  });

  Future<Article> getArticles(int id) async {
    return await api.article.infoById(id);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    String biomarkerDescription;
    try {
      biomarkerDescription = biomarker.content.description ?? "Описание к маркеру не добавлено :(";
    } catch (e) {
      biomarkerDescription = "Загружаем описание биомаркера...";
    }

    Future<Article> decreasedDesc;
    Future<Article> increasedDesc;
    Future<Article> decrease;
    Future<Article> increase;
    bool isReady = false;
    try {
      for (var article in biomarker.biomarkerArticles) {
        if (article.type.key == "decreased_desc")
          decreasedDesc = getArticles(article.articleId);
        else if (article.type.key == "increased_desc")
          increasedDesc = getArticles(article.articleId);
        else if (article.type.key == "decrease")
          decrease = getArticles(article.articleId);
        else
          increase = getArticles(article.articleId);
      }
      isReady = true;
    } catch (e) {
      isReady = false;
      print("ARTICLE: " + e.toString());
    }

    return isReady
        ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(bottom: Indents.sm),
              child: Text(
                "Информация",
                style: theme.textTheme.headline6.merge(TextStyle(color: theme.primaryColor)),
              ),
            ),
            Text(
              biomarkerDescription,
              style: theme.textTheme.bodyText2,
            ),
            Container(
                padding: EdgeInsets.only(top: Indents.md),
                margin: EdgeInsets.only(bottom: Indents.sm),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: Indents.sm),
                          child: Text("Чем опасен",
                              style: theme.textTheme.subtitle1.merge(TextStyle(color: theme.primaryColor)))),
                      FutureBuilder(
                          future: decreasedDesc,
                          builder: (context, AsyncSnapshot<Article> articleSnap) {
                            if (articleSnap.hasData) {
                              return DropText(
                                  header: "Пониженный показатель",
                                  inside: articleSnap.data.content.text,
                                  color: theme.colorScheme.onBackground);
                            } else {
                              return Container(
                                  height: 20,
                                  margin: EdgeInsets.only(bottom: Indents.sm),
                                  width: MediaQuery.of(context).size.width - Indents.md * 2,
                                  decoration: BoxDecoration(
                                    color: BioMadColors.base[200].withOpacity(0.8),
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                  ));
                            }
                          }),
                      FutureBuilder(
                          future: increasedDesc,
                          builder: (context, AsyncSnapshot<Article> articleSnap) {
                            if (articleSnap.hasData) {
                              return DropText(
                                  header: "Повышенный показатель",
                                  inside: articleSnap.data.content.text,
                                  color: theme.errorColor);
                            } else {
                              return Container(
                                  height: 20,
                                  margin: EdgeInsets.only(bottom: Indents.sm),
                                  width: MediaQuery.of(context).size.width - Indents.md * 2,
                                  decoration: BoxDecoration(
                                    color: BioMadColors.base[200].withOpacity(0.8),
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                  ));
                            }
                          }),
                    ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder(
                    future: increase,
                    builder: (context, AsyncSnapshot<Article> articleSnap) {
                      if (articleSnap.hasData) {
                        return RaisedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ArticleScreen(
                                  article: articleSnap.data,
                                );
                              },
                            );
                          },
                          child: Text('ПОВЫСИТЬ',
                              style: theme.textTheme.bodyText2.merge(TextStyle(color: theme.colorScheme.onPrimary))),
                          color: theme.errorColor,
                        );
                      } else {
                        return Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: BioMadColors.base[200].withOpacity(0.8),
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ));
                      }
                    }),
                FutureBuilder(
                    future: decrease,
                    builder: (context, AsyncSnapshot<Article> articleSnap) {
                      if (articleSnap.hasData) {
                        return RaisedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ArticleScreen(article: articleSnap.data);
                              },
                            );
                          },
                          child: Text('ПОНИЗИТЬ',
                              style: theme.textTheme.bodyText2.merge(TextStyle(color: theme.colorScheme.onPrimary))),
                          color: BioMadColors.success,
                        );
                      } else {
                        return Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: BioMadColors.base[200].withOpacity(0.8),
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ));
                      }
                    }),
                RaisedButton(
                  color: theme.primaryColor,
                  child: Icon(
                    Icons.share,
                    color: theme.colorScheme.background,
                  ),
                  onPressed: () {
                    Keys.rootNavigator.currentState.pushReplacementNamed(Routes.add_analysis);
                  },
                ),
              ],
            )
          ])
        : Container(child: Text("Ожидаем подгрузку информации..."));
  }
}
