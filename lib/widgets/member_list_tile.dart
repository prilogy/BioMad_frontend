import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/helpers/string_helpers.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/custom_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'custom_divider.dart';

class MemberListTile extends StatelessWidget {
  final Member model;
  final AsyncCallback onArrowTap;
  final AsyncCallback onTap;
  final bool divider;

  MemberListTile(this.model,
      {this.onArrowTap, this.divider = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final name = model?.name;
    final letterInButton = name?.substring(0, 1) ?? '?';
    final isCurrent = store.state.authorization?.currentMemberId == model.id;

    return CustomListTile(
      tilePadding: EdgeInsets.only(left: Indents.md),
      onTap: onTap,
      divider: CustomDivider(
        dividerPadding: EdgeInsets.symmetric(horizontal: Indents.md),
        color: Theme.of(context).canvasColor,
      ),
      height: 60,
      prepend: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: Indents.md),
            child: CircleAvatar(
                child: Text(
              letterInButton,
              style: theme.textTheme.headline5
                  .merge(TextStyle(color: theme.colorScheme.onPrimary)),
            )),
          ),
          Text(
            name,
            style: theme.textTheme.subtitle1,
          )
        ],
      ),
      append: Row(
        children: [
          isCurrent
              ? Text(
            tr('member_list_tile.current'),
                  style: theme.textTheme.subtitle1
                      .merge(TextStyle(color: theme.canvasColor)),
                )
              : Container(),
          IconButton(
            tooltip: tr('misc.edit'),
              icon: Icon(
                Icons.settings,
                color: theme.primaryColor,
              ),
              onPressed: onTap),
          !isCurrent
              ? IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    Icons.arrow_forward,
                    color: theme.primaryColor,
                  ),
                  tooltip: tr('member_list_tile.switch'),
                  onPressed: () async {
                    await onArrowTap?.call();
                  })
              : Container()
        ],
      ),
    );
  }
}
