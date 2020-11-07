import 'package:api/api.dart';
import 'package:biomad_frontend/helpers/color_helpers.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/helpers/string_helpers.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/custom_circle_avatar.dart';
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
  final EdgeInsetsGeometry padding;

  MemberListTile(this.model,
      {this.onArrowTap, this.padding = const EdgeInsets.only(left: Indents.md), this.divider = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final name = model?.name;
    final isCurrent = store.state.authorization?.currentMemberId == model.id;

    return CustomListTile(
      tilePadding: padding,
      onTap: onTap,
      divider: CustomDivider(
        dividerPadding: EdgeInsets.symmetric(horizontal: Indents.md),
        color: Theme.of(context).canvasColor,
      ),
      prepend: Row(
        children: [
          Padding(
              padding: EdgeInsets.only(right: Indents.md),
              child: CustomCircleAvatar(text: name, radius: AvatarSizes.md, backgroundColor: model.color == null ? theme.primaryColor : ColorHelpers.fromHex(model.color))),
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
