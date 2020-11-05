import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/text_field_validators.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/decorations.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class CustomSelectFormField<T> extends StatelessWidget with IndentsMixin {
  final InputDecoration inputDecoration;
  final String labelText;
  final String hintText;
  final Icon icon;
  final String Function(String) validator;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool obscureText;
  final List<T> items;
  final DropdownMenuItem Function(T) itemBuilder;
  final void Function(T) onChanged;
  final T value;


  CustomSelectFormField({this.inputDecoration,
    this.obscureText = false,
    @required this.labelText,
    this.hintText = '',
    this.icon,
    this.validator,
    @required this.onChanged,
    @required this.items,
    this.value,
    @required this.itemBuilder,
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

    return Theme(
      data: ThemeData(
          canvasColor: theme.colorScheme.background, primarySwatch: Colors.red),
      child: withIndents(
        child: DropdownButtonFormField(
          value: value,
          onChanged: onChanged,
          items: items
              .map((x) =>
              DropdownMenuItem(
                child: itemBuilder(x),
                value: x,
              ))
              .toList(),
          validator: (v) =>
          validator?.call(v) ?? TextFieldValidators.isNotEmpty(v),
          decoration: decoration,
        ),
      ),
    );
  }
}
