import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/helpers/text_field_validators.dart';
import 'package:biomad_frontend/models/member_biomarker_model_list.dart';
import 'package:biomad_frontend/screens/search_screen.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/custom/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BiomarkerAlertDialog extends StatefulWidget {
  final Widget? child;
  final String? title;
  final String? hintBiomarker;
  final String? hintUnit;
  final MemberBiomarkerModel? biomarker;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? titlePadding;
  final double? contentHeight;
  final void Function(MemberBiomarkerModel)? onChange;

  BiomarkerAlertDialog(BuildContext context,
      {Key? key,
      this.child,
      this.title,
      this.hintBiomarker,
      this.hintUnit,
      this.actions,
      this.biomarker,
      this.contentPadding,
      this.titlePadding,
      this.contentHeight,
      this.onChange})
      : super(key: key);

  @override
  _BiomarkerAlertDialogState createState() => _BiomarkerAlertDialogState(
      child, title, hintBiomarker, hintUnit, actions, biomarker, contentPadding, titlePadding, contentHeight);
}

class _BiomarkerAlertDialogState extends State<BiomarkerAlertDialog> {
  final Widget? child;
  final String? title;
  final String? hintBiomarker;
  final String? hintUnit;
  final List<Widget>? actions;
  MemberBiomarkerModel? biomarker;
  EdgeInsetsGeometry? contentPadding = const EdgeInsets.all(Indents.md);
  EdgeInsetsGeometry? titlePadding = const EdgeInsets.only(
    top: Indents.md,
    left: Indents.md,
    right: Indents.md,
  );
  final double? contentHeight;

  _BiomarkerAlertDialogState(this.child, this.title, this.hintBiomarker, this.hintUnit, this.actions, this.biomarker,
      this.contentPadding, this.titlePadding, this.contentHeight);

  //Форма биомаркеров
  var _biomarkerValueController = TextEditingController();

  //analysisId;
  var _biomarkerIdController = TextEditingController();
  var _biomarkerUnitIdController = TextEditingController();
  var _biomarkerFormKey = GlobalKey<FormState>();

  Unit? _unit;
  Biomarker? choosedBiomarker;
  int? biomarkerId;
  int? unitId;
  late Unit unit;

  Future<List<Biomarker>?> getBiomarkers() async {
    return await api.biomarker.info();
  }

  List<Biomarker>? biomarkers;

  @override
  void initState() {
    if (biomarker != null) {
      getBiomarkers().then((x) => {
            setState(() {
              biomarkers = x;
              choosedBiomarker = biomarkers!.firstWhere((element) => element.id == biomarker!.biomarkerId);
              _biomarkerIdController.text = choosedBiomarker!.content!.name!;
              _biomarkerValueController.text = biomarker!.value.toString();
            })
          });

      biomarkerId = biomarker!.biomarkerId;
      unitId = biomarker!.unitId;

      unit = store.state.unitList!.units!.firstWhere((element) => element.id == biomarker!.unitId);
      _biomarkerUnitIdController.text = unit.content!.name!;
    }

    super.initState();
  }

  //TODO: Добавить валидаторы
  MemberBiomarkerModel getMemberBiomarkerModel() => MemberBiomarkerModel(
        value: double.parse(_biomarkerValueController.text),
        biomarkerId: biomarkerId,
        unitId: unitId,
      );

  void onBiomarkerChange() {
    widget.onChange!(getMemberBiomarkerModel());
  }
  double heightFormValid = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String Function(String, {List<String> args, BuildContext context, String gender, Map<String, String> namedArgs}) _tr = trWithKey('biomarker_alert');
    store.dispatch(StoreThunks.refreshUnits());
    var txt = TextEditingController();

    return AlertDialog(
        scrollable: true,
        insetPadding: EdgeInsets.symmetric(horizontal: Indents.lg),
        content: Container(
          height: contentHeight ?? MediaQuery.of(context).size.height / 3 - 40 + heightFormValid,
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
                            validator: TextFieldValidators.isNotEmpty,
                            labelText: _tr('biomarker'),
                            disableLabelText: _tr('selected_biomarker'),
                            enabled: biomarker == null ? true : false,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SearchScreen(
                                      hintText: hintBiomarker ?? _tr('enter_biomarker'),
                                      dataList: biomarkers,
                                      initialValue: _biomarkerIdController.text,
                                      searchType: "biomarker",
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
                            formValidator: () {
                              return _biomarkerFormKey.currentState?.validate();
                            },
                            onChange: (x) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SearchScreen(
                                      hintText: hintBiomarker ?? _tr('enter_biomarker'),
                                      dataList: biomarkers,
                                      initialValue: _biomarkerIdController.text,
                                      searchType: "biomarker",
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
                              controller: _biomarkerValueController,
                              validator: TextFieldValidators.isNotEmpty,
                              formValidator: () {
                                return _biomarkerFormKey.currentState?.validate();
                              },
                              keyboardType: TextInputType.number,
                              labelText: _tr('value'),
                              onTap: () {}),
                          CustomTextFormField(
                            controller: _biomarkerUnitIdController,
                            enabled: biomarkerId != null || biomarker != null ? true : false,
                            disableLabelText: _tr('null_unit'),
                            validator: TextFieldValidators.isNotEmpty,
                            formValidator: () {
                              return _biomarkerFormKey.currentState?.validate();
                            },
                            margin: EdgeInsets.only(bottom: 0),
                            labelText: _tr('unit'),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    List<Unit> dataList = [];
                                    for (var unit in store.state.unitList!.units!)
                                      for (var unitId in choosedBiomarker!.unitIds!)
                                        if (unitId == unit.id) dataList.add(unit);

                                    return SearchScreen(
                                      hintText: hintUnit ?? _tr('enter_unit'),
                                      dataList: dataList,
                                      unitIds: choosedBiomarker!.unitIds,
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
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    List<Unit> dataList = [];
                                    for (var unit in store.state.unitList!.units!)
                                      for (var unitId in choosedBiomarker!.unitIds!)
                                        if (unitId == unit.id) dataList.add(unit);

                                    return SearchScreen(
                                      hintText: hintUnit ?? _tr('enter_unit'),
                                      dataList: dataList,
                                      unitIds: choosedBiomarker!.unitIds,
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
        contentPadding: contentPadding!,
        title: Text(
          title!,
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
            child: biomarker != null ? Text(tr('misc.edit')) : Text(tr('misc.add')),
            onPressed: () {
              if (_biomarkerFormKey.currentState!.validate()) {
                MemberBiomarkerModel answer = getMemberBiomarkerModel();

                if (biomarker != null) {
                  MemberBiomarkerModel bio = store.state.memberBiomarkerModelList!.biomarkers!
                      .firstWhere((element) => element.biomarkerId == biomarkerId);
                  bio.value = answer.value;
                  bio.unitId = answer.unitId;
                } else {
                  store.state.memberBiomarkerModelList!.biomarkers!.add(answer);
                }

                store.dispatch(StoreThunks.setMemberBiomarkerModels(store.state.memberBiomarkerModelList!.biomarkers));

                Navigator.of(context).pop();
              } else {
                setState(() {
                  heightFormValid = 40;
                });
              }
            },
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusValues.main),
        ));
  }
}
