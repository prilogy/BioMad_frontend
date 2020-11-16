import 'package:api/api.dart';
import 'package:biomad_frontend/containers/members_list_container.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/extensions/snack_bar_extension.dart';
import 'package:biomad_frontend/helpers/age_from_date.dart';
import 'package:biomad_frontend/helpers/color_helpers.dart';
import 'package:biomad_frontend/helpers/custom_alert_dialog.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/authorization.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/Gender/actions.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/styles/radius_values.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom_circle_avatar.dart';
import 'package:biomad_frontend/widgets/custom_list_builder.dart';
import 'package:biomad_frontend/widgets/custom_list_tile.dart';
import 'package:biomad_frontend/widgets/member_list_tile.dart';
import 'package:biomad_frontend/widgets/custom_divider.dart';
import 'package:biomad_frontend/widgets/social_account_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AccountContainer extends StatefulWidget {
  @override
  _AccountContainerState createState() => _AccountContainerState();
}

//Получение пола
//void gendersAsync() async{
//  var gen = await api.helper.genders();
//  store.dispatch(SetGender(gen.firstWhere((x)=>x.id == store.state.authorization.currentMember.genderId)));
//}

class _AccountContainerState extends State<AccountContainer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _tr = trWithKey('account_container');
    final user = store.state.user;
    final currentMember = store.state.authorization.currentMember;
    //Добавить локализацию
    //gendersAsync(); //Подгрузка гендеров

    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BlockBaseWidget(
          padding: EdgeInsets.only(
              top: Indents.md, left: Indents.md, right: Indents.md),
          margin: EdgeInsets.only(bottom: Indents.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                user.email,
                style: theme.textTheme.headline6
                    .merge(TextStyle(color: theme.primaryColor)),
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.supervisor_account,
                      color: theme.primaryColor,
                    ),
                    onPressed: () {
                      var h = CustomListTile.baseHeight *
                              (store.state.user?.members?.length ?? 1) +
                          CustomListTile.baseHeight +
                          10;
                      if (h > MediaQuery.of(context).size.height)
                        h = MediaQuery.of(context).size.height / 2;

                      var alert = customAlertDialog(context,
                          title: tr('member_list_container.title'),
                          contentHeight: h,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: Indents.md),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [MembersListContainer()],
                          ));

                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
        CustomDivider(
          text: _tr('current_profile'),
          dividerPadding: EdgeInsets.symmetric(vertical: Indents.smd),
        ),
        StoreConnector<AppState, Authorization>(
            converter: (store) => store.state.authorization,
            builder: (ctx, state) {
              final currentMember = state.currentMember;
              final gender = store.state.gender;

              return BlockBaseWidget(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomCircleAvatar(
                          radius: AvatarSizes.xl,
                          text: currentMember.name,
                          backgroundColor:
                              ColorHelpers.fromHex(currentMember.color),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: Indents.smd),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: Indents.sm),
                                child: Text(
                                  currentMember.name,
                                  style: theme.textTheme.headline6,
                                ),
                              ),
                              Text(
                                  (store.state.gender?.key ?? 'None') +
                                          ', ' +
                                          getAgeFromDate(
                                                  currentMember.dateBirthday)
                                              .toString(),
                                  style: theme.textTheme.bodyText2.merge(
                                      TextStyle(
                                          color: theme.colorScheme.onSurface)))
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
        CustomDivider(
          text: _tr('socials'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Indents.sm),
          child: StoreConnector<AppState, User>(
            converter: (store) => store.state.user,
            builder: (ctx, state) => Column(
              children: [
                for (var item in [
                  SocialAccountProvider.google,
                  SocialAccountProvider.facebook,
                  SocialAccountProvider.vk
                ])
                  SocialAccountListTile(item)
              ],
            ),
          ),
        ),
        CustomDivider(
          text: tr('misc.other'),
        ),
        CustomListTile(
          onTap: () {
            Keys.rootNavigator.currentState.pushReplacementNamed(Routes.auth);
            WidgetsBinding.instance.addPostFrameCallback(
                (x) => store.dispatch(StoreThunks.logOut()));
          },
          prepend: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: Indents.md),
                  child: CustomCircleAvatar(
                      radius: AvatarSizes.md,
                      backgroundColor:
                          theme.primaryColor.withOpacity(ColorAlphas.a10),
                      child: Icon(
                        Icons.exit_to_app,
                        color: theme.primaryColor,
                      ))),
              Text(tr('misc.log_out'), style: theme.textTheme.subtitle1)
            ],
          ),
        )
      ]),
    );
  }
}
