import 'package:biomad_frontend/helpers/custom_alert_dialog.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:easy_localization/easy_localization.dart';
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
      child: Text(noText ?? tr('misc.no')),
      onPressed: () async {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        await onNo?.call();
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
        yesText ?? tr('misc.yes'),
        style: TextStyle(color: BioMadColors.error),
      ),
      onPressed: () async {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        await onYes?.call();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = customAlertDialog(
      context,
      contentHeight: 50,
      title: tr('misc.warning'),
      child: Text(descriptionText ??
          tr('accept_dialog.desc')),
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
