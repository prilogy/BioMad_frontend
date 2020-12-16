import 'package:biomad_frontend/helpers/indents_mixin.dart';
import 'package:biomad_frontend/helpers/text_field_validators.dart';
import 'package:biomad_frontend/styles/app_theme.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/decorations.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget with IndentsMixin {
  final TextEditingController controller;
  final InputDecoration inputDecoration;
  final String labelText;
  final String disableLabelText;
  final String hintText;
  final icon;
  final initialValue;
  final keyboardType;
  var enabled;
  var maxLines;
  var focusNode;
  var enableInteractiveSelection;
  final String Function(String) validator;
  final void Function(String) onChange;
  final void Function() onTap;
  final bool Function() formValidator;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool obscureText;
  final Color enabledColor;
  final Color disabledColor;

  CustomTextFormField(
      {@required this.controller,
      this.inputDecoration,
      this.obscureText = false,
      @required this.labelText,
      this.hintText = '',
      this.disableLabelText = '',
      this.icon,
      this.onChange,
      this.enabled = true,
      this.maxLines = 1,
      this.onTap,
      this.focusNode,
      this.enableInteractiveSelection = true,
      this.initialValue,
      this.keyboardType,
      this.formValidator,
      this.validator,
      this.enabledColor,
      this.disabledColor,
      this.margin = const EdgeInsets.only(bottom: Indents.md),
      this.padding});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var baseDecoration = Decorations.input(context);
    final decoration = inputDecoration ??
        InputDecoration(
          focusedBorder: baseDecoration.focusedBorder,
          enabledBorder: enabledColor != null
              ? OutlineInputBorder(
                  borderRadius: Decorations.borderRadius,
                  borderSide: BorderSide(
                      color: enabledColor, width: AppTheme.borderWidth),
                )
              : baseDecoration.enabledBorder,
          disabledBorder: OutlineInputBorder(
            borderRadius: Decorations.borderRadius,
            borderSide: BorderSide(
                color: theme.disabledColor.withOpacity(0.2),
                width: AppTheme.borderWidth),
          ),
          errorBorder: baseDecoration.errorBorder,
          focusedErrorBorder: baseDecoration.focusedErrorBorder,
          hintText: hintText,
          prefixIcon: maxLines == 1 ? icon : null,
          labelText: enabled ? labelText : disableLabelText,
          errorStyle: baseDecoration.errorStyle,
          alignLabelWithHint: true,
        );

    return withIndents(
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: TextFormField(
          obscureText: obscureText,
          focusNode: focusNode,
          style: enabled
              ? null
              : TextStyle(color: theme.disabledColor.withOpacity(0.37)),
          enableInteractiveSelection: enableInteractiveSelection,
          enabled: enabled,
          maxLines: maxLines,
          onFieldSubmitted: (x) {
            formValidator?.call();
          },
          onTap: onTap ?? null,
          onChanged: onChange ?? (x) {},
          validator: (v) => validator?.call(v),
          controller: controller,
          decoration: decoration,
          initialValue: initialValue ?? null,
          keyboardType: keyboardType ?? TextInputType.text,
        ),
      ),
    );
  }
}
