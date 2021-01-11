import 'dart:async';

import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/custom/custom_button.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SharedScreen extends StatefulWidget {
  final int memberAnalysisId;
  final List<int> biomarkerIds;

  SharedScreen({Key key, this.memberAnalysisId, this.biomarkerIds}) : super(key: key);

  @override
  _SharedScreenState createState() => _SharedScreenState(memberAnalysisId, biomarkerIds);
}

class _SharedScreenState extends State<SharedScreen> {
  final int memberAnalysisId;
  final List<int> biomarkerIds;

  _SharedScreenState(this.memberAnalysisId, this.biomarkerIds);

  Future<List<Shared>> getSharedData() async {
    return await api.shared.info();
  }

  Future<String> getLocal() async {
    String currentLocale;
    try {
      currentLocale = await Devicelocale.currentLocale;
      currentLocale = currentLocale.substring(0, 2);
      return currentLocale;
    } on PlatformException {
      print("Error obtaining current locale");
      return null;
    }
  }

  @override
  void initState() {
    SharedModel result = SharedModel(memberAnalysisId: memberAnalysisId, biomarkerIds: biomarkerIds);
    api.shared.add(result);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double chars = (MediaQuery.of(context).size.width) / 6;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            tr('shared.name'),
            style: TextStyle(fontSize: 18, color: theme.primaryColor),
          ),
        ),
        body: Scaffold(
          body: FutureBuilder(
              future: Future.delayed(Duration(milliseconds: 1400)),
              builder: (c, s) => s.connectionState == ConnectionState.done
                  ? FutureBuilder(
                      future: Future.wait([
                        getSharedData(),
                        getLocal(),
                      ]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Shared> shared = snapshot.data[0];
                          String localization = snapshot.data[1];
                          print(shared);
                          String sharedLink = shared[0].url.toString() + "?culture=" + localization.substring(0, 2);
                          return Container(
                              padding: EdgeInsets.only(left: Indents.sm, right: Indents.sm),
                              margin: EdgeInsets.only(left: Indents.md, right: Indents.md),
                              child: GestureDetector(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(sharedLink.substring(0, chars.toInt()) + "...",
                                            style: theme.textTheme.subtitle1
                                                .merge(TextStyle(color: theme.primaryColor.withOpacity(0.8)))),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: theme.primaryColor.withOpacity(0.8),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: Indents.sm, horizontal: Indents.lg),
                                          margin: EdgeInsets.only(top: Indents.sm),
                                          child: Text(tr('shared.copy'),
                                              style: theme.textTheme.subtitle1
                                                  .merge(TextStyle(color: BioMadColors.base[100]))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Clipboard.setData(new ClipboardData(text: sharedLink));
                                  SnackBarExtension.warning(tr('shared.copied'), duration: Duration(seconds: 2));
                                },
                              ));
                        } else {
                          return Center(child:   Column(
                            children: <Widget>[
                              SizedBox(
                                height: 200.0,
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        width: 160,
                                        height: 160,
                                        child: new CircularProgressIndicator(
                                          strokeWidth: 8,
                                          valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                                        ),
                                      ),
                                    ),
                                    Center(child: Text(tr('shared.link_create'))),
                                  ],
                                ),
                              ),
                            ],
                          ));
                        }
                      })
                  : Center(
                      child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 200.0,
                          child: Stack(
                            children: <Widget>[
                              Center(
                                child: Container(
                                  width: 160,
                                  height: 160,
                                  child: new CircularProgressIndicator(
                                    strokeWidth: 8,
                                    valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                                  ),
                                ),
                              ),
                              Center(child: Text(tr('shared.link_wait'))),
                            ],
                          ),
                        ),
                      ],
                    ))),
        ));
  }
}
