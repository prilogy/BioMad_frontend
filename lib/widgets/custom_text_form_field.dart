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
  final String hintText;
  final Icon icon;
  final String Function(String) validator;
  final void Function(String) onChange;
  final Future<dynamic> onTap;
  final bool Function() formValidator;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool obscureText;
  final Color enabledColor;

  CustomTextFormField(
      {@required this.controller,
      this.inputDecoration,
      this.obscureText = false,
      @required this.labelText,
      this.hintText = '',
      this.icon,
      this.onChange,
        this.onTap,
      this.formValidator,
      this.validator,
      this.enabledColor,
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
            errorBorder: baseDecoration.errorBorder,
            focusedErrorBorder: baseDecoration.focusedErrorBorder,
            hintText: hintText,
            prefixIcon: icon,
            labelText: labelText,
            errorStyle: baseDecoration.errorStyle);

    return withIndents(
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: TextFormField(
          obscureText: obscureText,
          onFieldSubmitted: (x) {
            formValidator?.call();
          },
          onChanged: onChange ?? (x) {},
          validator: (v) =>
              validator?.call(v) ?? TextFieldValidators.isNotEmpty(v),
          controller: controller,
          decoration: decoration,
        ),
      ),
    );
  }
}
