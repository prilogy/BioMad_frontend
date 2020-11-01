import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AcceptDialog {
  static void show(BuildContext context,
      {String titleText,
      String descriptionText,
      String yesText,
      String noText,
      AsyncCallback onYes,
      AsyncCallback onNo}) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(noText ?? "No"),
      onPressed: () async {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        await onNo?.call();
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
        yesText ?? "Yes",
        style: TextStyle(color: BioMadColors.error),
      ),
      onPressed: () async {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        await onYes?.call();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(titleText ?? "Предупреждение"),
      content: Text(descriptionText ??
          "Это действие будет невозможно отменить, вы хотите продолжить?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
