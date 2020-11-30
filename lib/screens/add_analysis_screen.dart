import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/date_time_formats.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/biomarker_alert.dart';
import 'package:biomad_frontend/widgets/biomarker_item.dart';
import 'package:biomad_frontend/widgets/custom_date_form_field.dart';
import 'package:biomad_frontend/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddAnalysisScreen extends StatefulWidget {
  final String title;
  final Member member;
  final void Function(MemberAnalysisModel) onChange;

  AddAnalysisScreen({Key key, this.title, this.member, this.onChange})
      : super(key: key);

  @override
  _AddAnalysisScreenState createState() => _AddAnalysisScreenState();
}

class _AddAnalysisScreenState extends State<AddAnalysisScreen> {
  final _analysisController = TextEditingController();
  final _dateController = TextEditingController();
  final int _labId = 1;
  final _descriptionController = TextEditingController();
  List<MemberBiomarkerModel> _biomarkers = [];
  var _biomarkerName;
  var _biomarkerUnitName;

  MemberAnalysisModel getMemberAnalysisModel() => MemberAnalysisModel(
      name: _analysisController.text,
      date: DateTimeFormats.defaultDate.parse(_dateController.text),
      labId: _labId,
      description: _descriptionController.text,
      biomarkers: _biomarkers);

  void onChange() {
    widget.onChange(getMemberAnalysisModel());
  }

  String biomarkerJson;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Keys.rootNavigator.currentState
                        .pushReplacementNamed(Routes.main);
                  },
                );
              },
            ),
            title: Text("Добавить анализ",
                style: TextStyle(color: Theme.of(context).primaryColor)),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  MemberAnalysisModel result = getMemberAnalysisModel();
//                  biomarkerJson = "[";
//                  for (var elem in _biomarkers) {
//                    biomarkerJson += elem.toJson().toString() + ', ';
//                  }
//                  var QueryJson ='{name: ' +
//                      result.name +
//                      ', description: ' +
//                      result.description +
//                      ', labId: ' +
//                      result.labId.toString() +
//                      ', date: ' +
//                      result.date.toString() +
//                      ', biomarkers: ' +
//                      biomarkerJson +
//                      ']}';
                  api.memberAnalysis.add(result);
                },
              )
            ]),
        body: Container(
            padding: EdgeInsets.only(
                top: Indents.md, left: Indents.md, right: Indents.md),
            margin: EdgeInsets.only(bottom: Indents.sm),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  CustomTextFormField(
                    controller: _analysisController,
                    icon: Icon(Icons.assignment),
                    labelText: "Анализ",
                    hintText: "Введите название анализа",
                    onChange: (x) {
                      onChange();
                    },
                    formValidator: () {
                      return _formKey?.currentState?.validate();
                    },
                  ),
                  CustomDateFormField(
                    type: CustomDateFormFieldType.date,
                    labelText: "Дата сдачи анализа",
                    controller: _dateController,
                    icon: Icon(Icons.date_range),
                    onDateSelected: (x) {
                      onChange();
                    },
                  ),
                  CustomTextFormField(
                    controller: _descriptionController,
                    icon: Icon(Icons.comment),
                    labelText: "Примечание",
                    hintText: "Уточните детали",
                    onChange: (x) {
                      onChange();
                    },
                    formValidator: () {
                      return _formKey?.currentState?.validate();
                    },
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(top: Indents.sm),
                              margin: EdgeInsets.only(bottom: Indents.sm),
                              child: Text("Биомаркеры",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .merge(TextStyle(
                                          color: theme.primaryColor)))),
                          IconButton(
                            icon: Icon(Icons.add),
                            color: BioMadColors.primary,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  //_biomarkerFormKey
                                  //======= ЛИСТ БИОМАРКЕРОВ ========//
                                  return BiomarkerAlertDialog(
                                    context,
                                    title: "Добавить биомаркер",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: Indents.md),
                                  );
                                },
                              ).then((val) {
                                setState(() {
                                  _biomarkers.add(val[0]);
                                  _biomarkerName = val[1] ?? "Unnamed";
                                  _biomarkerUnitName = val[2] ?? "unnamed";
                                });
                              });
                            },
                          )
                        ],
                      ),
                      Container(
                          height: 76 * _biomarkers.length.toDouble(),
                          width: MediaQuery.of(context).size.width,
                          child: ScrollConfiguration(
                            behavior: NoRippleScrollBehaviour(),
                            child: ListView.builder(
                                itemCount: _biomarkers.length,
                                itemBuilder: (context, index) => BiomarkerItem(
                                    name: _biomarkerName ?? "Unnamed",
                                    value: _biomarkers[index].value ?? "null",
                                    unit: _biomarkerUnitName ?? "unnamed",
                                    status: "<status>")),
                          )),
                    ],
                  )
                ]))));
  }
}
