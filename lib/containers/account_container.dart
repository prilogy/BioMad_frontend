import 'package:api/api.dart';
import 'file:///Z:/flutter/biomad_frontend/lib/helpers/i18n_helper.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom_list_builder.dart';
import 'package:biomad_frontend/widgets/custom_list_tile.dart';
import 'package:biomad_frontend/widgets/member_list_tile.dart';
import 'package:biomad_frontend/widgets/custom_divider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AccountContainer extends StatefulWidget {
  @override
  _AccountContainerState createState() => _AccountContainerState();
}

class _AccountContainerState extends State<AccountContainer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tr = trWithKey('account_container');

    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BlockBaseWidget(
          padding: EdgeInsets.only(
              top: Indents.md, left: Indents.md, right: Indents.md),
          margin: EdgeInsets.only(bottom: Indents.sm),
          child: Text(
            tr('your_account'),
            style: theme.textTheme.headline6
                .merge(TextStyle(color: theme.primaryColor)),
          ),
        ),
        CustomDivider(
          text: tr('my_profiles'),
          dividerPadding: EdgeInsets.only(top: Indents.smd),
        ),
        StoreConnector<AppState, User>(
            converter: (store) => store.state.user,
            builder: (ctx, state) => CustomListBuilder(
                gap: 0,
                items: () {
                  var members = state.members;
                  members.sort((a, b) =>
                      a.name.toLowerCase().compareTo(b.name.toLowerCase()));
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
                        }, onSuccess: () {
                          SnackBarExtension.success('Успешно сменен юзер');
                        }, onError: () {
                          SnackBarExtension.error(
                              'Непредвиденная ошибка при смене профиля');
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
          height: 60,
          prepend: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: Indents.md),
                child: CircleAvatar(
                  backgroundColor:
                      theme.primaryColor.withOpacity(ColorAlphas.a10),
                  child: Icon(
                    Icons.add,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              Text(tr('add_profile'), style: theme.textTheme.subtitle1)
            ],
          ),
        )
      ]),
    );
  }
}
