import 'package:biomad_frontend/helpers/date_time_formats.dart';
import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/text_field_validators.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/decorations.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

enum CustomDateFormFieldType { date, dateTime, time }

class CustomDateFormField extends StatelessWidget with IndentsMixin {
  final InputDecoration inputDecoration;
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Icon icon;
  final String Function(DateTime) validator;
  final bool Function() formValidator;
  final void Function(DateTime) onDateSelected;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final CustomDateFormFieldType type;

  CustomDateFormField(
      {this.inputDecoration,
      @required this.controller,
      @required this.labelText,
      this.hintText = '',
      this.icon,
      this.type = CustomDateFormFieldType.date,
      this.formValidator,
      this.validator,
      this.onDateSelected,
      this.margin = const EdgeInsets.only(bottom: Indents.md),
      this.padding});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var baseDecoration = Decorations.input(context);
    final decoration = inputDecoration ??
        InputDecoration(
            focusedBorder: baseDecoration.focusedBorder,
            enabledBorder: baseDecoration.enabledBorder,
            errorBorder: baseDecoration.errorBorder,
            focusedErrorBorder: baseDecoration.focusedErrorBorder,
            hintText: hintText,
            prefixIcon: icon,
            labelText: labelText,
            errorStyle: baseDecoration.errorStyle);

    return withIndents(
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: DateTimeField(
          format: DateTimeFormats.defaultDate,
          onChanged: onDateSelected ?? (x) {},
          onShowPicker: (context, currentValue) async {
            DateTime date;
            if (type != CustomDateFormFieldType.time)
              date = await DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1960, 12, 31),
                  maxTime: DateTime(2022, 12, 31),
                  theme: DatePickerTheme(
                      headerColor:
                          Theme.of(context).primaryColor.withOpacity(0.9),
                      backgroundColor: Colors.white,
                      itemStyle: TextStyle(
                          color: Theme.of(context).shadowColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
                  currentTime: currentValue ?? DateTime.now(),
                  locale: store.state.settings.culture == "ru"
                      ? LocaleType.ru
                      : LocaleType.en);

            if (type == CustomDateFormFieldType.date) if (date == null)
              return currentValue;
            else
              return date;

            if (type != CustomDateFormFieldType.date) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            }

            return currentValue;
          },
          controller: controller,
          validator: (v) => validator?.call(v) ?? null,
          decoration: decoration,
        ),
      ),
    );
  }
}
