import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/screens/search_screen.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'custom/custom_text_form_field.dart';

class AddReferenceAlertDialog extends StatefulWidget {
  final Widget child;
  final String title;
  final String hintBiomarker;
  final String hintUnit;
  final MemberBiomarkerModel biomarker;
  final List<Widget> actions;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry titlePadding;
  final double contentHeight;
  List<Biomarker> customBiomarker;
  final void Function(MemberBiomarkerReferenceModel) onChange;

  AddReferenceAlertDialog(BuildContext context,
      {Key key,
      this.child,
      this.title,
      this.hintBiomarker,
      this.hintUnit,
      this.actions,
      this.biomarker,
      this.contentPadding,
      this.titlePadding,
      this.contentHeight,
      this.customBiomarker,
      this.onChange})
      : super(key: key);

  @override
  _AddReferenceAlertDialogState createState() => _AddReferenceAlertDialogState(
      child, title, hintBiomarker, hintUnit, actions, biomarker, contentPadding, titlePadding, contentHeight, customBiomarker);
}

class _AddReferenceAlertDialogState extends State<AddReferenceAlertDialog> {
  final Widget child;
  final String title;
  final String hintBiomarker;
  final String hintUnit;
  final List<Widget> actions;
  MemberBiomarkerModel biomarker;
  EdgeInsetsGeometry contentPadding = const EdgeInsets.all(Indents.md);
  EdgeInsetsGeometry titlePadding = const EdgeInsets.only(
    top: Indents.md,
    left: Indents.md,
    right: Indents.md,
  );
  final double contentHeight;
  List<Biomarker> customBiomarker;

  _AddReferenceAlertDialogState(this.child, this.title, this.hintBiomarker, this.hintUnit, this.actions, this.biomarker,
      this.contentPadding, this.titlePadding, this.contentHeight, this.customBiomarker);

  //Форма биомаркеров
  var _biomarkerValueAController = TextEditingController();
  var _biomarkerValueBController = TextEditingController();

  //analysisId;
  var _biomarkerIdController = TextEditingController();
  var _biomarkerUnitIdController = TextEditingController();
  var _biomarkerFormKey = GlobalKey<FormState>();

  Unit _unit;
  Biomarker choosedBiomarker;
  int biomarkerId;
  int unitId;
  Unit unit;

  Future<List<Biomarker>> getBiomarkers() async {
    return await api.biomarker.info();
  }

  List<Biomarker> biomarkers;

  @override
  void initState() {
    if (biomarker != null) {
      getBiomarkers().then((x) => {
            setState(() {
              biomarkers = x;
              choosedBiomarker = biomarkers.firstWhere((element) => element.id == biomarker.biomarkerId);
              _biomarkerIdController.text = choosedBiomarker.content.name;
              _biomarkerValueAController.text = choosedBiomarker.reference.valueA.toString();
              _biomarkerValueBController.text = choosedBiomarker.reference.valueB.toString();
            })
          });

      biomarkerId = biomarker.biomarkerId;
      unitId = biomarker.unitId;

      unit = store.state.unitList.units.firstWhere((element) => element.id == biomarker.unitId);
      _biomarkerUnitIdController.text = unit.content.name;
    }

    super.initState();
  }

  //TODO: Добавить валидаторы
  MemberBiomarkerReferenceModel getMemberBiomarkerReferenceModel() => MemberBiomarkerReferenceModel(
        valueA: double.parse(_biomarkerValueAController.text),
        valueB: double.parse(_biomarkerValueBController.text),
        unitId: unitId,
        biomarkerId: biomarkerId,
      );

  void onBiomarkerChange() {
    widget.onChange(getMemberBiomarkerReferenceModel());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    store.dispatch(StoreThunks.refreshUnits());
    final _tr = trWithKey('biomarker_alert');

    return AlertDialog(
        scrollable: true,
        insetPadding: EdgeInsets.symmetric(horizontal: Indents.lg),
        content: Container(
          height: contentHeight ?? MediaQuery.of(context).size.height / 2.6,
          width: MediaQuery.of(context).size.width,
          child: ScrollConfiguration(
              behavior: NoRippleScrollBehaviour(),
              child: ListView(children: [
                Container(
                    padding: EdgeInsets.only(top: Indents.sm, left: Indents.md, right: Indents.md),
                    child: Form(
                        key: _biomarkerFormKey,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          CustomTextFormField(
                            controller: _biomarkerIdController,
                            validator: null,
                            labelText: _tr('biomarker'),
                            disableLabelText: _tr('selected_biomarker'),
                            enabled: biomarker == null ? true : false,
                            onTap: () {
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SearchScreen(
                                      hintText: hintBiomarker ?? _tr('enter_biomarker'),
                                      dataList: biomarkers,
                                      customBiomarker: customBiomarker,
                                      initialValue: _biomarkerIdController.text,
                                      searchType: "customs",
                                    );
                                  }).then((val) {
                                biomarker = null;
                                _biomarkerIdController.value = TextEditingValue(
                                  text: val.content.name,
                                  selection: TextSelection.fromPosition(
                                    TextPosition(offset: val.content.name.length),
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
                                      hintText: hintBiomarker ?? _tr('enter_biomarker'),
                                      dataList: biomarkers,
                                      customBiomarker: customBiomarker,
                                      initialValue: _biomarkerIdController.text,
                                      searchType: "customs",
                                    );
                                  }).then((val) {
                                _biomarkerIdController.value = TextEditingValue(
                                  text: val.content.name,
                                  selection: TextSelection.fromPosition(
                                    TextPosition(offset: val.content.name.length),
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
                              controller: _biomarkerValueAController,
                              validator: null,
                              keyboardType: TextInputType.number,
                              labelText: _tr('down_line'),
                              onTap: () {}),
                          CustomTextFormField(
                              controller: _biomarkerValueBController,
                              validator: null,
                              keyboardType: TextInputType.number,
                              labelText: _tr('up_line'),
                              onTap: () {}),
                          CustomTextFormField(
                            controller: _biomarkerUnitIdController,
                            enabled: biomarkerId != null || biomarker != null ? true : false,
                            disableLabelText: _tr('null_unit'),
                            validator: null,
                            margin: EdgeInsets.only(bottom: 0),
                            labelText: _tr('units'),
                            onTap: () {
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    List<Unit> dataList = [];
                                    for (var unit in store.state.unitList.units)
                                      for (var unitId in choosedBiomarker.unitIds) if (unitId == unit.id) dataList.add(unit);

                                    return SearchScreen(
                                      hintText: hintUnit ?? _tr('enter_unit'),
                                      dataList: dataList,
                                      unitIds: choosedBiomarker.unitIds,
                                      initialValue: _biomarkerUnitIdController.text,
                                      searchType: "unit",
                                    );
                                  }).then((val) {
                                _biomarkerUnitIdController.value = TextEditingValue(
                                  text: val.content.name,
                                  selection: TextSelection.fromPosition(
                                    TextPosition(offset: val.content.name.length),
                                  ),
                                );
                                setState(() {
                                  unitId = val.id;
                                  _unit = val;
                                });
                              });
                            },
                            onChange: (x) {
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SearchScreen(
                                      hintText: hintUnit ?? _tr('enter_unit'),
                                      dataList: store.state.unitList.units,
                                      unitIds: choosedBiomarker.unitIds,
                                      initialValue: _biomarkerUnitIdController.text,
                                      searchType: "unit",
                                    );
                                  }).then((val) {
                                _biomarkerUnitIdController.value = TextEditingValue(
                                  text: val.content.name,
                                  selection: TextSelection.fromPosition(
                                    TextPosition(offset: val.content.name.length),
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
            child: Text(tr('misc.cancel')),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(tr('misc.continue')),
            onPressed: () {
              MemberBiomarkerReferenceModel answer = getMemberBiomarkerReferenceModel();
              api.memberBiomarker.addReference(answer).then((value) => print("REQUEST STATE: " + value.toString()));
              Navigator.of(context).pop();
            },
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusValues.main),
        ));
  }
}
