import 'package:api/api.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/custom/custom_circle_avatar.dart';
import 'package:biomad_frontend/widgets/custom/custom_list_builder.dart';
import 'package:biomad_frontend/widgets/custom/custom_list_tile.dart';
import 'package:biomad_frontend/widgets/member_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MembersListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _tr = trWithKey('member_list_container');
    return Column(
      children: [
        StoreConnector<AppState, User>(
            converter: (store) => store.state.user,
            builder: (ctx, state) => CustomListBuilder(
                gap: 0,
                items: () {
                  var members = state.members;
                  members.sort((a, b) => (a.name + a.id.toString())
                      .toLowerCase()
                      .compareTo((b.name + b.id.toString()).toLowerCase()));
                  return state.members;
                }(),
                itemBuilder: (Member model, isLast) => MemberListTile(
                      model,
                      onArrowTap: () async {
                        store.dispatch(StoreThunks.authorize(() async {
                          return await api.auth.refreshToken(
                              RefreshTokenAuthenticationModel(
                                  refreshToken: store
                                      .state.authorization.refreshToken.token,
                                  memberId: model.id,
                                  userId: store.state.user.id));
                        }));
                      },
                      onTap: () async {
                        Keys.rootNavigator.currentState
                            .pushNamed(Routes.member, arguments: model);
                      },
                    ))),
        CustomListTile(
          onTap: () {
            Keys.rootNavigator.currentState.pushNamed(Routes.member);
          },
          prepend: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: Indents.md),
                child: CustomCircleAvatar(
                  radius: AvatarSizes.md,
                  backgroundColor:
                      theme.primaryColor.withOpacity(ColorAlphas.a10),
                  child: Icon(
                    Icons.add,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              Text(_tr('add_profile'), style: theme.textTheme.subtitle1)
            ],
          ),
        ),
      ],
    );
  }
}
