import 'dart:math';

import 'package:api/api.dart';
import 'package:biomad_frontend/containers/member_container.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/accept_dialog.dart';
import 'package:biomad_frontend/helpers/date_time_formats.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/random.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/custom_circle_avatar.dart';
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
  MemberModel _memberModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final _tr = trWithKey('member_screen');
    final title =
        widget.member == null ? _tr('new_profile') : _tr('edit_profile');

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
                  var res = await api.member.add(_memberModel);
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
                        .edit(_memberModel, widget.member.id);
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
                child: MemberContainer(
              widget.member,
              changeColor: widget.member == null,
              onChange: (x) => _memberModel = x,
            )),
          ],
        ),
      ),
    );
  }
}
