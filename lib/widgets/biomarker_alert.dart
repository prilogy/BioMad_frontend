import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/screens/search_screen.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:flutter/material.dart';

import 'biomarker_form_field.dart';
import 'custom_text_form_field.dart';

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
  var _biomarkerValueController = TextEditingController();

  //analysisId;
  var _biomarkerIdController = TextEditingController();
  var _biomarkerUnitIdController = TextEditingController();
  var _biomarkerFormKey = GlobalKey<FormState>();

  List<Biomarker> _biomarker;
  List<Biomarker> _unit;
  Biomarker choosedBiomarker;
  int biomarkerId;
  int unitId;

  //TODO: Добавить валидаторы
  MemberBiomarkerModel getMemberBiomarkerModelModel() => MemberBiomarkerModel(
        value: double.parse(_biomarkerValueController.text),
        analysisId: 1,
        biomarkerId: biomarkerId,
        unitId: unitId,
      );

  void onBiomarkerChange() {
    widget.onChange(getMemberBiomarkerModelModel());
  }

  Future<List<Biomarker>> getBiomarkers() async {
    return await api.biomarker.info();
  }

  @override
  void initState() {
    getBiomarkers().then((x) => {
          setState(() {
            _biomarker = x;
          })
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    store.dispatch(StoreThunks.refreshUnits());
    var txt = TextEditingController();
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
                              CustomTextFormField(
                                controller: _biomarkerIdController,
                                validator: null,
                                labelText: "Биомаркер",
                                onTap: () {
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SearchScreen(
                                          hintText: hintBiomarker ??
                                              "Введите биомаркер",
                                          dataList: _biomarker,
                                          initialValue:
                                              _biomarkerIdController.text,
                                          searchType: "biomarker",
                                        );
                                      }).then((val) {
                                    _biomarkerIdController.value =
                                        TextEditingValue(
                                      text: val.content.name,
                                      selection: TextSelection.fromPosition(
                                        TextPosition(
                                            offset: val.content.name.length),
                                      ),
                                    );
                                    setState(() {
                                      choosedBiomarker = val;
                                      biomarkerId = val.id;
                                    });
                                  });
                                },
                                onChange: (x) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SearchScreen(
                                          hintText: hintBiomarker ??
                                              "Введите биомаркер",
                                          dataList: _biomarker,
                                          initialValue:
                                              _biomarkerIdController.text,
                                          searchType: "biomarker",
                                        );
                                      }).then((val) {
                                    _biomarkerIdController.value =
                                        TextEditingValue(
                                      text: val.content.name,
                                      selection: TextSelection.fromPosition(
                                        TextPosition(
                                            offset: val.content.name.length),
                                      ),
                                    );
                                    setState(() {
                                      choosedBiomarker = val;
                                      biomarkerId = val.id;
                                    });
                                  });
                                },
                              ),
                              CustomTextFormField(
                                  controller: _biomarkerValueController,
                                  validator: null,
                                  keyboardType: TextInputType.number,
                                  labelText: "Значение",
                                  onTap: () {}),
                              CustomTextFormField(
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
                                              "Введите единицу измерения",
                                          dataList: store.state.unitList.units,
                                          initialValue:
                                              _biomarkerUnitIdController.text,
                                          searchType: "unit",
                                        );
                                      }).then((val) {
                                    _biomarkerUnitIdController.value =
                                        TextEditingValue(
                                      text: val.content.name,
                                      selection: TextSelection.fromPosition(
                                        TextPosition(
                                            offset: val.content.name.length),
                                      ),
                                    );
                                    setState(() {
                                      unitId = val.id;
                                    });
                                  });
                                },
                                onChange: (x) {
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SearchScreen(
                                          hintText: hintUnit ??
                                              "Введите единицу измерения",
                                          dataList: store.state.unitList.units,
                                          initialValue:
                                              _biomarkerUnitIdController.text,
                                          searchType: "unit",
                                        );
                                      }).then((val) {
                                    _biomarkerUnitIdController.value =
                                        TextEditingValue(
                                      text: val.content.name,
                                      selection: TextSelection.fromPosition(
                                        TextPosition(
                                            offset: val.content.name.length),
                                      ),
                                    );
                                    setState(() {
                                      unitId = val.id;
                                    });
                                  });
                                },
                              ),
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
              List<dynamic> ret = [];
              ret.add(answer);
              ret.add(_biomarkerIdController.text);
              ret.add(_biomarkerUnitIdController.text);
              ret.add(biomarkerId);
              Navigator.of(context).pop(ret);
            },
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusValues.main),
        ));
  }
}
