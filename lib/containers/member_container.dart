import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/age_from_date.dart';
import 'package:biomad_frontend/helpers/color_helpers.dart';
import 'package:biomad_frontend/helpers/date_time_formats.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/random.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/custom/custom_circle_avatar.dart';
import 'package:biomad_frontend/widgets/custom/custom_date_form_field.dart';
import 'package:biomad_frontend/widgets/custom/custom_select_form_field.dart';
import 'package:biomad_frontend/widgets/custom/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MemberContainer extends StatefulWidget {
  final Member? member;
  final bool changeColor;
  final String? prefilledName;
  final void Function(MemberModel)? onChange;
  final bool isRegistration;

  MemberContainer(this.member,
      {this.changeColor = true, this.onChange, this.prefilledName, this.isRegistration = false});

  @override
  _MemberContainerState createState() => _MemberContainerState(isRegistration);
}

class _MemberContainerState extends State<MemberContainer> {
  final _nameController = TextEditingController();
  final _dateBirthDayController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bool isRegistration;

  _MemberContainerState(this.isRegistration);

  int? _genderId;
  Color _avatarColor = BioMadColors.primary;
  String? _profilePreviewName;
  int? _profilePreviewAge;

  MemberModel getMemberModel() => MemberModel(
        name: _nameController.text,
        genderId: _genderId,
        color: ColorHelpers.toHex(_avatarColor),
        dateBirthday: DateTimeFormats.defaultDate.parse(_dateBirthDayController.text),
      );

  void onChange() {
    widget.onChange!(getMemberModel());
  }

  @override
  void initState() {
    if (widget.prefilledName != null)
      setState(() {
        _nameController.text = widget.prefilledName!;
        _profilePreviewName = widget.prefilledName;
        _avatarColor = colors[randomInRange(0, colors.length - 1)];
      });

    if (widget.member != null)
      setState(() {
        final name = widget.member!.name!;
        _nameController.text = name;
        _profilePreviewName = name;
        _dateBirthDayController.text = DateTimeFormats.defaultDate.format(widget.member!.dateBirthday ?? DateTime.now());
        _profilePreviewAge = getAgeFromDate(widget.member!.dateBirthday!);
        _genderId = widget.member!.genderId;
        if (widget.member!.color != null) _avatarColor = ColorHelpers.fromHex(widget.member!.color!);
      });

    getGenders().then((x) => {
          setState(() {
            _genders = x;
          })
        });

    super.initState();
  }

  final List<Color> colors = [
    Colors.red,
    Colors.redAccent,
    Colors.amber,
    Colors.blue,
    Colors.blueAccent,
    Colors.lightBlue,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.amberAccent,
    Colors.orangeAccent,
    Colors.indigo,
    Colors.green,
    Colors.pinkAccent,
    Colors.cyan,
    Colors.deepOrangeAccent
  ];

  List<Gender>? _genders;

  Future<List<Gender>?> getGenders() async {
    return await api.helper.genders();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateBirthDayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String Function(String?, {List<String> args, BuildContext context, String gender, Map<String, String> namedArgs}) _ttr = trWithKey('gender');
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Indents.sm, bottom: Indents.lg),
            child: Row(
              children: [
                CustomCircleAvatar(
                  text: _profilePreviewName,
                  backgroundColor: _avatarColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: Indents.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (_profilePreviewName == null || _profilePreviewName == '')
                            Text(tr('member_container.your_name_or_alias'),
                                style: theme.textTheme.headline6!.merge(TextStyle(color: theme.canvasColor)))
                          else
                            Text(
                              _nameController.text,
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.headline6,
                            ),
                          if (_profilePreviewAge != null)
                            Text(
                              ', ' + _profilePreviewAge.toString(),
                              style: theme.textTheme.headline6!.merge(TextStyle(color: theme.canvasColor)),
                            ),
                          if (_genderId != null && _genders != null)
                            Text(
                              (_genderId != null ? ', ' : '') +
                                      _ttr(_genders!.firstWhere((x) => x.id == _genderId).key).toLowerCase(),
                              style: theme.textTheme.headline6!.merge(TextStyle(color: theme.canvasColor)),
                            )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          CustomTextFormField(
            controller: _nameController,
            labelText: tr('input_hint.name'),
            onChange: (x) {
              setState(() {
                _profilePreviewName = x;
                if (widget.changeColor == true) _avatarColor = colors[randomInRange(0, colors.length - 1)];
              });
              onChange();
            },
            icon: Icon(Icons.account_circle_outlined),
            formValidator: () {
              return _formKey.currentState?.validate();
            },
          ),
          CustomDateFormField(
            type: CustomDateFormFieldType.date,
            labelText: tr('input_hint.date_birthday'),
            controller: _dateBirthDayController,
            icon: Icon(Icons.date_range),
            onDateSelected: (x) {
              setState(() {
                _profilePreviewAge = x == null ? null : getAgeFromDate(x);
              });
              onChange();
            },
          ),
          _genders != null
              ? CustomSelectFormField<Gender>(
                  icon: Icon(Icons.face),
                  labelText: tr('input_hint.sex'),
                  value: widget.member == null ? null : _genders!.firstWhere((x) => x.id == widget.member!.genderId),
                  onChanged: (x) {
                    setState(() {
                      _genderId = x!.id;
                    });
                    onChange();
                  },
                  items: _genders,
                  itemBuilder: (x) => DropdownMenuItem(
                      child: Text((isRegistration ? x.content?.name! : x.content?.name ?? x.key!)!)))
              : Container()
        ],
      ),
    );
  }
}
