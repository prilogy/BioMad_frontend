import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

import 'biomarker_alert.dart';

Widget tmpBiomarker(context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      RaisedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return BiomarkerAlertDialog(
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
              return BiomarkerAlertDialog(
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
  );
}