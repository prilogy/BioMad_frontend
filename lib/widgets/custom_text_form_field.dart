import 'package:biomad_frontend/helper/text_field_validators.dart';
import 'package:biomad_frontend/styles/color_opacity.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration inputDecoration;
  final String labelText;
  final String hintText;
  final Icon icon;
  final String Function(String) validator;
  final bool Function() formValidator;

  CustomTextFormField({@required this.controller,
    this.inputDecoration,
    @required this.labelText,
    this.hintText = '',
    this.icon,
    this.formValidator,
    this.validator});

  @override
  Widget build(BuildContext context) {
    final borderWidth = 2.0;
    final theme = Theme.of(context);
    final decoration = inputDecoration == null
        ? InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: theme.primaryColor, width: borderWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: theme.canvasColor, width: borderWidth),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: theme.errorColor, width: borderWidth),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: theme.errorColor.withOpacity(ColorAlphas.a30),
              width: borderWidth),
        ),
        hintText: hintText,
        prefixIcon: icon,
        hoverColor: Colors.red,
        labelText: labelText,
        errorStyle: TextStyle(
            color: theme.errorColor
        )
    )
        : inputDecoration;

    final focusNode = FocusNode();

    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: TextFormField(
        focusNode: focusNode,
        onEditingComplete: () {
          formValidator?.call();
          focusNode.unfocus();
        },
        validator: (v) =>
        validator?.call(v) ?? TextFieldValidators.isNotEmpty(v),
        controller: controller,
        decoration: decoration,
      ),
    );
  }
}
