import 'package:biomad_frontend/containers/account_container.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/screens/search_screen.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/biomarker_alert.dart';
import 'package:biomad_frontend/widgets/biomarker_form_field.dart';
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  PanelController _panelController = PanelController();

  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen = 500;
  double _panelHeightClosed = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
                "Добро пожаловать, " +
                    store.state.authorization.currentMember.name,
                style: TextStyle(color: Theme.of(context).primaryColor)),
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return biomarkerAlertDialog(
                          context,
                          title: "Добавить биомаркер",
                          actions: <Widget>[
                            TextButton(
                              child: Text('Отмена'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Добавить'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                          contentPadding:
                              EdgeInsets.symmetric(vertical: Indents.md),
                        );
                      },
                    );
                  },
                  child: const Text('Добавить биомаркер',
                      style: TextStyle(fontSize: 20)),
                ),
                RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return biomarkerAlertDialog(
                          context,
                          title: "Изменить биомаркер",
                          actions: <Widget>[
                            TextButton(
                              child: Text('Отмена'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Изменить'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                          //contentHeight: h,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: Indents.md),
                        );
                      },
                    );
                  },
                  child: const Text('Изменить биомаркер',
                      style: TextStyle(fontSize: 20)),
                ),
                RaisedButton(
                  onPressed: () {
                    Keys.rootNavigator.currentState
                        .pushReplacementNamed(Routes.biomarker);
                  },
                  child: const Text('Открыть биомаркер',
                      style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: NavBar.indent,
            right: NavBar.indent,
            child: NavBar(
              onAvatarTap: () {
                _panelController.open();
              },
            )),
        SlidingUpPanel(
          backdropEnabled: true,
          controller: _panelController,
          maxHeight: _panelHeightOpen,
          minHeight: _panelHeightClosed,
          parallaxEnabled: true,
          parallaxOffset: .5,
          panelBuilder: (sc) => ListView(
            padding: EdgeInsets.symmetric(vertical: 0),
            children: [
              AccountContainer(),
            ],
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(RadiusValues.main),
              topRight: Radius.circular(RadiusValues.main)),
          onPanelSlide: (double pos) => setState(() {
            _fabHeight =
                pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
          }),
        ),
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
