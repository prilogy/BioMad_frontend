import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/screens/search_screen.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:flutter/material.dart';

import 'biomarker_form_field.dart';

class BiomarkerAlertDialog extends StatefulWidget {
  final Widget child;
  final String title;
  final String hintBiomarker;
  final String hintUnit;
  final List<Widget> actions;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry titlePadding;
  final double contentHeight;
  final void Function(MemberBiomarkerModel) onChange;

  BiomarkerAlertDialog(BuildContext context,
      {Key key,
      this.child,
      this.title,
      this.hintBiomarker,
      this.hintUnit,
      this.actions,
      this.contentPadding,
      this.titlePadding,
      this.contentHeight,
      this.onChange})
      : super(key: key);

  @override
  _BiomarkerAlertDialogState createState() => _BiomarkerAlertDialogState(
      child,
      title,
      hintBiomarker,
      hintUnit,
      actions,
      contentPadding,
      titlePadding,
      contentHeight);
}

class _BiomarkerAlertDialogState extends State<BiomarkerAlertDialog> {
  final Widget child;
  final String title;
  final String hintBiomarker;
  final String hintUnit;
  final List<Widget> actions;
  EdgeInsetsGeometry contentPadding = const EdgeInsets.all(Indents.md);
  EdgeInsetsGeometry titlePadding = const EdgeInsets.only(
    top: Indents.md,
    left: Indents.md,
    right: Indents.md,
  );
  final double contentHeight;

  _BiomarkerAlertDialogState(
      this.child,
      this.title,
      this.hintBiomarker,
      this.hintUnit,
      this.actions,
      this.contentPadding,
      this.titlePadding,
      this.contentHeight);

  //Форма биомаркеров
  final _biomarkerValueController = TextEditingController();

  //analysisId;
  final _biomarkerIdController = TextEditingController();
  final _biomarkerUnitIdController = TextEditingController();
  final _biomarkerFormKey = GlobalKey<FormState>();

  //TODO: Добавить валидаторы
  MemberBiomarkerModel getMemberBiomarkerModelModel() => MemberBiomarkerModel(
        value: 1.2,
        analysisId: 1,
        biomarkerId: 1,
        unitId: 1,
      );

  void onBiomarkerChange() {
    widget.onChange(getMemberBiomarkerModelModel());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
        scrollable: true,
        insetPadding: EdgeInsets.symmetric(horizontal: Indents.lg),
        content: Container(
          height: contentHeight ?? MediaQuery.of(context).size.height / 3 - 40,
          width: MediaQuery.of(context).size.width,
          child: ScrollConfiguration(
              behavior: NoRippleScrollBehaviour(),
              child: ListView(children: [
                Container(
                    padding: EdgeInsets.only(
                        top: Indents.sm, left: Indents.md, right: Indents.md),
                    child: Form(
                        key: _biomarkerFormKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BiomarkerFormField(
                                  controller: _biomarkerIdController,
                                  validator: null,
                                  labelText: "Биомаркер",
                                  onTap: () {
                                    return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SearchScreen(
                                              hintText: hintBiomarker ??
                                                  "Введите биомаркер");
                                        });
                                  }),
                              BiomarkerFormField(
                                  controller: _biomarkerValueController,
                                  validator: null,
                                  labelText: "Значение",
                                  onTap: () {}),
                              BiomarkerFormField(
                                  controller: _biomarkerUnitIdController,
                                  validator: null,
                                  margin: EdgeInsets.only(bottom: 0),
                                  labelText: "Единицы измерения",
                                  onTap: () {
                                    return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SearchScreen(
                                              hintText: hintUnit ??
                                                  "Введите единицу измерения");
                                        });
                                  }),
                            ])))
              ])),
        ),
        titlePadding: titlePadding,
        contentPadding: contentPadding,
        title: Text(
          title,
          style: theme.textTheme.headline6,
        ),
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
              MemberBiomarkerModel answer = getMemberBiomarkerModelModel();
              Navigator.of(context).pop(answer);
            },
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusValues.main),
        ));
  }
}
