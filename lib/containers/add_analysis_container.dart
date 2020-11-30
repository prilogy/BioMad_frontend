import 'package:api/api.dart';
import 'package:biomad_frontend/containers/biomarker_container.dart';
import 'package:biomad_frontend/helpers/date_time_formats.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/helpers/no_ripple_scroll_behaviour.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/biomarker_form_field.dart';
import 'package:biomad_frontend/widgets/biomarker_item.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom_circle_avatar.dart';
import 'package:biomad_frontend/widgets/custom_date_form_field.dart';
import 'package:biomad_frontend/widgets/custom_divider.dart';
import 'package:biomad_frontend/widgets/custom_list_tile.dart';
import 'package:biomad_frontend/widgets/custom_text_form_field.dart';
import 'package:biomad_frontend/widgets/nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddAnalysisContainer extends StatefulWidget {
  final String title;
  final Member member;
  final void Function(MemberAnalysisModel) onChange;

  AddAnalysisContainer({Key key, this.title, this.member, this.onChange})
      : super(key: key);

  @override
  _AddAnalysisContainerState createState() => _AddAnalysisContainerState();
}

class _AddAnalysisContainerState extends State<AddAnalysisContainer> {
//  Future<List<Lab>> getLabs() async {
//    return await api.helper.lab();
//  }

//  @override
//  Widget build(BuildContext context) {
//    final theme = Theme.of(context);
//    var category = store.state.categoryList.categories
//        .firstWhere((element) => element.id == 1);
//
//    return Scaffold(
//      appBar: AppBar(
//        leading: Builder(
//          builder: (BuildContext context) {
//            return IconButton(
//              icon: Icon(Icons.arrow_back),
//              onPressed: () {
//                Keys.rootNavigator.currentState
//                    .pushReplacementNamed(Routes.main);
//              },
//            );
//          },
//        ),
//        title: Text("Добавить анализ",
//            style: TextStyle(color: Theme.of(context).primaryColor)),
//      ),
//      body: Container(
//          child: Column(
//        children: [
//          BiomarkerFormField(
//              controller: null,
//              validator: null,
//              labelText: "Название анализа",
//              onTap: () {}),
//          BlockBaseWidget(
//            padding: EdgeInsets.only(
//                top: Indents.md, left: Indents.md, right: Indents.md),
//            margin: EdgeInsets.only(bottom: Indents.sm),
//            header: "Биомаркеры",
//            headerMergeStyle: TextStyle(color: theme.primaryColor),
//            child: Container(
//              height:
//                  70 * store.state.categoryList.categories.length.toDouble(),
//              width: MediaQuery.of(context).size.width,
//              child: ScrollConfiguration(
//                behavior: NoRippleScrollBehaviour(),
//                child: ListView.builder(
//                    itemCount: store.state.categoryList.categories.length,
//                    itemBuilder: (context, index) =>
//                        analysisItem(index, category)),
//              ),
//            ),
//          )
//        ],
//      )),
//    );
//  }

  final _analysisController = TextEditingController();
  final _dateController = TextEditingController();
  final int _labId = 1;
  final _descriptionController = TextEditingController();
  final _biomarkers = []; //List<MemberBiomarkerModel>
  final _formKey = GlobalKey<FormState>();

  MemberAnalysisModel getMemberAnalysisModel() => MemberAnalysisModel(
        name: _analysisController.text,
        date: DateTimeFormats.defaultDate.parse(_dateController.text),
        labId: _labId,
        description: _descriptionController.text,
        biomarkers: _biomarkers
      );

  void onChange() {
    widget.onChange(getMemberAnalysisModel());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding:
          EdgeInsets.only(top: Indents.md, left: Indents.md, right: Indents.md),
      margin: EdgeInsets.only(bottom: Indents.sm),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
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
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: Indents.sm),
                    margin: EdgeInsets.only(bottom: Indents.sm),
                    child:
                    Text("Биомаркеры", style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: theme.primaryColor)))),
                Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                    child: ScrollConfiguration(
                      behavior: NoRippleScrollBehaviour(),
                      child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) => BiomarkerItem(
                              name: "Название биомаркера",
                              value: 23,
                              unit: "мкг/г",
                              status: "повышенный")),
                    )),
              ],
            )
// TODO: Заменить блок гендера на лаборатории
//          _genders != null
//              ? CustomSelectFormField<Gender>(
//              icon: Icon(Icons.face),
//              labelText: tr('input_hint.sex'),
//              value: widget.member == null
//                  ? null
//                  : _genders
//                  .firstWhere((x) => x.id == widget.member.genderId),
//              onChanged: (x) {
//                setState(() {
//                  _genderId = x.id;
//                });
//                onChange();
//              },
//              items: _genders,
//              itemBuilder: (x) => DropdownMenuItem(child: Text(x.content?.name ?? x.key)))
//              : Container()
          ],
        ),
      ),
    );

    Widget analysisItem(int index, category) {
      final theme = Theme.of(context);
      var category = store.state.categoryList.categories[index];

      return GestureDetector(
        onTap: () {
          Keys.rootNavigator.currentState.pushReplacementNamed(
              Routes.category_analysis,
              arguments: category.id);
        },
        child: Container(
          padding: EdgeInsets.only(left: Indents.md, right: Indents.sm),
          margin: EdgeInsets.only(
            top: index == 0 ? Indents.md : Indents.smd,
          ),
          decoration: BoxDecoration(
            color: BioMadColors.base[100],
            borderRadius: BorderRadius.all(Radius.circular(4)),
            boxShadow: [
              BoxShadow(
                color: BioMadColors.base.withOpacity(0.06),
                blurRadius: 7,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Icon(
                  Icons.favorite,
                  color: BioMadColors.success,
                  size: 32.0,
                ),
                Container(
                  padding: EdgeInsets.all(Indents.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.content.name,
                        style: theme.textTheme.bodyText2,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          "Состояние: 80%",
                          style: theme.textTheme.caption
                              .merge(TextStyle(color: BioMadColors.success)),
                        ),
                      )
                    ],
                  ),
                )
              ]),
              IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: BioMadColors.primary,
                    size: 24.0,
                  ),
                  onPressed: null)
            ],
          ),
        ),
      );
    }
  }
}
