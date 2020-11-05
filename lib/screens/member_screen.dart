import 'package:api/api.dart';
import 'file:///Z:/flutter/biomad_frontend/lib/helpers/i18n_helper.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/accept_dialog.dart';
import 'package:biomad_frontend/helpers/date_time_formats.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom_date_form_field.dart';
import 'package:biomad_frontend/widgets/custom_future_builder.dart';
import 'package:biomad_frontend/widgets/custom_select_form_field.dart';
import 'package:biomad_frontend/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MemberScreen extends StatefulWidget {
  final Member member;

  MemberScreen({this.member});

  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  final _nameController = TextEditingController();
  final _dateBirthDayController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int _genderId;

  MemberModel getMemberModel() => MemberModel(
      name: _nameController.text,
      genderId: _genderId,
      dateBirthday:
          DateTimeFormats.defaultDate.parse(_dateBirthDayController.text));

  @override
  void initState() {
    if (widget.member != null)
      setState(() {
        _nameController.text = widget.member.name;
        _dateBirthDayController.text =
            DateTimeFormats.defaultDate.format(widget.member.dateBirthday);
        _genderId = widget.member.genderId;
      });
    super.initState();
  }

  @override
  void dispose() {
    _nameController?.dispose();
    _dateBirthDayController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final _tr = trWithKey('member_screen');
    final title = widget.member?.name ?? _tr('new_profile');

    final actionButton = widget.member != null &&
            widget.member.id != store.state.authorization.currentMemberId
        ? FlatButton(
            child:
                Text(_tr('delete'), style: TextStyle(color: theme.errorColor)),
            onPressed: () {
              AcceptDialog.show(context, onYes: () async {
                var res = await api.member.delete(widget.member.id);
                if (res == false) {
                  SnackBarExtension.error(_tr('delete_error'));
                  return;
                }

                store.dispatch(StoreThunks.authorizeWithRefreshToken());
                SnackBarExtension.success(_tr('delete_success'));
                Navigator.of(context).pop();
              });
            })
        : widget.member == null
            ? IconButton(
                icon: Icon(Icons.add),
                tooltip: tr('misc.add'),
                onPressed: () async {
                  var res = await api.member.add(getMemberModel());
                  if (res == null) {
                    SnackBarExtension.error(_tr('add_error'));
                    return;
                  }

                  store.dispatch(StoreThunks.authorizeWithRefreshToken());
                  SnackBarExtension.success(_tr('add_success'));
                  Navigator.of(context).pop();
                })
            : Container();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        actions: [
          actionButton,
          widget.member != null
              ? IconButton(
                  tooltip: tr('misc.save'),
                  onPressed: () async {
                    var res = await api.member
                        .edit(getMemberModel(), widget.member.id);
                    if (res == null) {
                      SnackBarExtension.error(tr('misc.save_error'));
                      return;
                    }

                    store.dispatch(StoreThunks.authorizeWithRefreshToken());
                    SnackBarExtension.success(tr('misc.save_success'));
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.check),
                )
              : Container()
        ],
        title: Text(title, style: TextStyle(color: theme.primaryColor)),
      ),
      body: Container(
        child: Column(
          children: [
            BlockBaseWidget(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _nameController,
                      labelText: tr('input_hint.name'),
                      icon: Icon(Icons.account_circle_outlined),
                      formValidator: () {
                        return _formKey?.currentState?.validate();
                      },
                    ),
                    CustomDateFormField(
                      type: CustomDateFormFieldType.date,
                      labelText: tr('input_hint.date_birthday'),
                      controller: _dateBirthDayController,
                    ),
                    CustomFutureBuilder<List<Gender>>(
                      future: api.helper.genders(),
                      builder: (data) => CustomSelectFormField<Gender>(
                          icon: Icon(Icons.face),
                          labelText: tr('input_hint.sex'),
                          value: widget.member == null
                              ? null
                              : data.firstWhere(
                                  (x) => x.id == widget.member.genderId),
                          onChanged: (x) {
                            _genderId = x.id;
                          },
                          items: data,
                          itemBuilder: (x) =>
                              DropdownMenuItem(child: Text(x.key))),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
