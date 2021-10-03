import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/date_time_formats.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/helpers/text_field_validators.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_alert.dart';
import 'package:biomad_frontend/widgets/biomarker/biomarker_item.dart';
import 'package:biomad_frontend/widgets/custom/custom_date_form_field.dart';
import 'package:biomad_frontend/widgets/custom/custom_text_form_field.dart';
import 'package:biomad_frontend/widgets/on_load_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AddAnalysisScreen extends StatefulWidget {
  final String? title;
  final Member? member;
  final void Function(MemberAnalysisModel)? onChange;

  AddAnalysisScreen({Key? key, this.title, this.member, this.onChange}) : super(key: key);

  @override
  _AddAnalysisScreenState createState() => _AddAnalysisScreenState();
}

class _AddAnalysisScreenState extends State<AddAnalysisScreen> {
  final _analysisController = TextEditingController();
  final _dateController = TextEditingController();
  final _labController = TextEditingController();

  final int _labId = 1;
  final _descriptionController = TextEditingController();
  List<MemberBiomarkerModel>? _biomarkers = store.state.memberBiomarkerModelList!.biomarkers;

  String? biomarkerJson;
  final _formKey = GlobalKey<FormState>();

  MemberAnalysisModel getMemberAnalysisModel() => MemberAnalysisModel(
      name: _analysisController.text,
      date: DateTimeFormats.defaultDate.parse(_dateController.text),// ?? DateTimeFormats.defaultDate.format(DateTime.now()) as DateTime?,
      //labId: _labId,
      description:
          _descriptionController.text == "" || _descriptionController.text == null ? "Примечаний нет" : _descriptionController.text,
      biomarkers: _biomarkers ?? []);

  void onChange() {
    widget.onChange!(getMemberAnalysisModel());
  }

  Future<List<Biomarker>?> getBiomarker() async {
    return await api.biomarker.info();
  }

  @override
  void initState() {
    store.dispatch(StoreThunks.setMemberBiomarkerModels(_biomarkers));
    setState(() {
      _dateController.text = DateTimeFormats.defaultDate.format(DateTime.now());
    });
    super.initState();
  }

  @override
  void dispose() {
    _analysisController.dispose();
    _dateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String Function(String, {List<String> args, BuildContext context, String gender, Map<String, String> namedArgs}) _tr = trWithKey('add_analysis');
    Future<List<Biomarker>?> biomarkers = getBiomarker();
    return Scaffold(
        appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    store.dispatch(store.state.memberBiomarkerModelList!.biomarkers = []);
                    store.dispatch(StoreThunks.refreshMemberAnalysis());
                    Keys.rootNavigator.currentState!.pushReplacementNamed(Routes.main);
                  },
                );
              },
            ),
            title: Text(_tr('add'), style: TextStyle(color: Theme.of(context).primaryColor)),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    MemberAnalysisModel result = getMemberAnalysisModel();
                    try {
                      _biomarkers = store.state.memberBiomarkerModelList!.biomarkers;
                      print(_biomarkers![0].value);
                      api.memberAnalysis.add(result);
                      store.dispatch(StoreThunks.refreshMemberAnalysis());

                      Keys.rootNavigator.currentState!.pushReplacementNamed(Routes.main, arguments: 600);
                    } catch (e) {
                      SnackBarExtension.warning(tr('snack_bar.add_biomarker'), duration: Duration(seconds: 4));
                    }
                  }
                },
              )
            ]),
        body: WillPopScope(
            onWillPop: () async {
              Keys.rootNavigator.currentState!.pushReplacementNamed(Routes.main);
              return false;
            },
            child: Container(
                padding: EdgeInsets.only(top: Indents.md, left: Indents.md, right: Indents.md),
                margin: EdgeInsets.only(bottom: Indents.sm),
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      CustomTextFormField(
                        controller: _analysisController,
                        validator: TextFieldValidators.isNotEmpty,
                        icon: Icon(Icons.assignment_outlined),
                        labelText: _tr('name'),
                        hintText: _tr('enter_name'),
                        onChange: (x) {
                          onChange();
                        },
                        formValidator: () {
                          return _formKey.currentState?.validate();
                        },
                      ),
                      CustomDateFormField(
                        type: CustomDateFormFieldType.date,
                        validator: (v) {
                          if (_dateController.text.isEmpty) {
                            return tr('input_hint.not_empty');
                          }
                          return null;
                        },
                        labelText: _tr('date'),
                        controller: _dateController,
                        icon: Icon(Icons.date_range),
                        onDateSelected: (x) {
                          onChange();
                        },
                      ),
                      CustomTextFormField(
                        controller: _descriptionController,
                        icon: Icon(Icons.comment_outlined),
                        labelText: _tr('note'),
                        hintText: _tr('enter_note'),
                        maxLines: 5,
                        onChange: (x) {
                          onChange();
                        },
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(top: Indents.sm),
                                  margin: EdgeInsets.only(bottom: Indents.sm),
                                  child: Text(_tr('biomarkers'),
                                      style: Theme.of(context).textTheme.headline6!.merge(TextStyle(color: theme.primaryColor)))),
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: IconButton(
                                  padding: EdgeInsets.only(right: Indents.sm),
                                  icon: Icon(Icons.add),
                                  color: BioMadColors.primary,
                                  iconSize: 24,
                                  onPressed: () {
                                    FocusScope.of(context).nextFocus();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        //_biomarkerFormKey
                                        //======= ЛИСТ БИОМАРКЕРОВ ========//
                                        return BiomarkerAlertDialog(
                                          context,
                                          title: _tr('add_biomarker'),
                                          contentPadding: EdgeInsets.symmetric(vertical: Indents.md),
                                        );
                                      },
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                          StoreConnector<AppState, List<MemberBiomarkerModel>?>(
                            converter: (store) => store.state.memberBiomarkerModelList!.biomarkers,
                            builder: (ctx, state) {
                              _biomarkers = store.state.memberBiomarkerModelList!.biomarkers;
                              return Container(
                                  height: 76 * _biomarkers!.length.toDouble() < 304
                                      ? 76 * _biomarkers!.length.toDouble()
                                      : MediaQuery.of(context).size.height - AppBar().preferredSize.height - 372,
                                  width: MediaQuery.of(context).size.width,
                                  child: ScrollConfiguration(
                                      behavior: NoRippleScrollBehaviour(),
                                      child: ListView.builder(
                                          itemCount: _biomarkers!.length,
                                          itemBuilder: (context, index) {
                                            return FutureBuilder(
                                                future: biomarkers,
                                                builder: (context, AsyncSnapshot<List<Biomarker>?> biomarkers) {
                                                  if (biomarkers.hasData) {
                                                    Biomarker biomarkerItem = biomarkers.data!
                                                        .firstWhere((element) => element.id == _biomarkers![index].biomarkerId);
                                                    return BiomarkerItem(
                                                      value: _biomarkers![index].value ?? null,
                                                      unit: store.state.unitList!.units!
                                                              .firstWhere((element) => element.id == _biomarkers![index].unitId)
                                                              .content!
                                                              .shorthand ??
                                                          "unnamed",
                                                      unitId: _biomarkers![index].unitId,
                                                      id: _biomarkers![index].biomarkerId,
                                                      biomarkerState: biomarkerItem.state,
                                                      biomarkerName: biomarkerItem.content!.name,
                                                      isModel: true,
                                                      index: index,
                                                    );
                                                  } else {
                                                    return OnLoadContainer(
                                                      index: index,
                                                      padding: EdgeInsets.zero,
                                                    );
                                                  }
                                                });
                                          })));
                            },
                          )
                        ],
                      )
                    ])))));
  }
}
