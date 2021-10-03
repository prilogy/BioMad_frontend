import 'dart:async';

import 'package:api/api.dart';
import 'package:biomad_frontend/containers/members_list_container.dart';
import 'package:biomad_frontend/helpers/age_from_date.dart';
import 'package:biomad_frontend/helpers/color_helpers.dart';
import 'package:biomad_frontend/helpers/custom_alert_dialog.dart';
import 'package:biomad_frontend/helpers/i18n_helper.dart';
import 'package:biomad_frontend/helpers/keys.dart';
import 'package:biomad_frontend/models/authorization.dart';
import 'package:biomad_frontend/router/main.dart';
import 'package:biomad_frontend/services/api.dart';
import 'package:biomad_frontend/store/main.dart';
import 'package:biomad_frontend/store/thunks.dart';
import 'package:biomad_frontend/styles/avatar_sizes.dart';
import 'package:biomad_frontend/styles/biomad_colors.dart';
import 'package:biomad_frontend/styles/color_alphas.dart';
import 'package:biomad_frontend/styles/indents.dart';
import 'package:biomad_frontend/widgets/add_reference_alert.dart';
import 'package:biomad_frontend/widgets/block_base_widget.dart';
import 'package:biomad_frontend/widgets/custom/custom_button.dart';
import 'package:biomad_frontend/widgets/custom/custom_circle_avatar.dart';
import 'package:biomad_frontend/widgets/custom/custom_divider.dart';
import 'package:biomad_frontend/widgets/custom/custom_list_tile.dart';
import 'package:biomad_frontend/widgets/social_account_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AccountContainer extends StatefulWidget {
  @override
  _AccountContainerState createState() => _AccountContainerState();
}

class _AccountContainerState extends State<AccountContainer> {
  Future<List<Biomarker>?> getBiomarker() async {
    return await api.biomarker.info();
  }

  late StreamController<Future<List<Biomarker>>?> searchStream;
  Future<List<Biomarker>?>? biomarkers;

  void _loadBiomarkers(biomarkers) async => searchStream.add(biomarkers);

  @override
  void initState() {
    searchStream = StreamController<Future<List<Biomarker>>?>();
    biomarkers = getBiomarker();
    _loadBiomarkers(biomarkers);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String Function(String, {List<String> args, BuildContext context, String gender, Map<String, String> namedArgs}) _tr = trWithKey('account_container');
    final String Function(String, {List<String> args, BuildContext context, String gender, Map<String, String> namedArgs}) _ttr = trWithKey('gender');
    final user = store.state.user!;
    final currentMember = store.state.authorization!.currentMember;
    List<Biomarker> customBiomarker = [];
    //Добавить локализацию
    //gendersAsync(); //Подгрузка гендеров

    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BlockBaseWidget(
          padding: EdgeInsets.only(top: Indents.md, left: Indents.md, right: Indents.md),
          margin: EdgeInsets.only(bottom: Indents.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                user.email!,
                style: theme.textTheme.headline6!.merge(TextStyle(color: theme.primaryColor)),
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
                      var h = CustomListTile.baseHeight * (store.state.user?.members?.length ?? 1) + CustomListTile.baseHeight + 10;
                      if (h > MediaQuery.of(context).size.height) h = MediaQuery.of(context).size.height / 2;

                      var alert = customAlertDialog(context,
                          title: tr('member_list_container.title'),
                          contentHeight: h,
                          contentPadding: EdgeInsets.symmetric(vertical: Indents.md),
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
            converter: (store) => store.state.authorization!,
            builder: (ctx, state) {
              final currentMember = state.currentMember;
              final gender = store.state.helper!.genders!;

              return BlockBaseWidget(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomCircleAvatar(
                          radius: AvatarSizes.xl,
                          text: currentMember.name,
                          backgroundColor: ColorHelpers.fromHex(currentMember.color!),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: Indents.smd),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: Indents.sm),
                                child: Text(
                                  currentMember.name!,
                                  style: theme.textTheme.headline6,
                                ),
                              ),
                              Text(
                                  _ttr((gender.firstWhere((x) => x.id == currentMember.genderId).key ?? 'neutral')) +
                                      ', ' +
                                      getAgeFromDate(currentMember.dateBirthday!).toString(),
                                  style: theme.textTheme.bodyText2!.merge(TextStyle(color: theme.colorScheme.onSurface)))
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
          text: _tr('custom_references'),
          dividerPadding: EdgeInsets.symmetric(vertical: Indents.smd),
        ),
        StreamBuilder(
            stream: searchStream.stream,
            builder: (context, snap) {
              if (snap.hasData) {
                return FutureBuilder(
                    future: snap.data as Future<List<Biomarker>>,
                    builder: (context, AsyncSnapshot<List<Biomarker>> biomarkersSnap) {
                      customBiomarker = [];
                      if (biomarkersSnap.hasData) {
                        for (var item in biomarkersSnap.data!) {
                          try {
                            if (item.reference!.isOwnReference!) customBiomarker.add(item);
                          } catch (e) {}
                        }
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customBiomarker.length != 0
                                  ? Container(
                                      height: customBiomarker.length * 21.0,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) => Divider(
                                          color: Theme.of(context).colorScheme.onSurface,
                                        ),
                                        padding: EdgeInsets.only(
                                          left: Indents.md,
                                          right: Indents.md,
                                        ),
                                        itemCount: customBiomarker.length,
                                        itemBuilder: (context, index) => Container(
                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                          Text(
                                              customBiomarker[index].content!.name!.length > 26
                                                  ? customBiomarker[index].content!.name!.substring(0, 26) + "..."
                                                  : customBiomarker[index].content!.name!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .merge(TextStyle(color: BioMadColors.base[500], fontWeight: FontWeight.normal))),
                                          Row(children: [
                                            Text(
                                                customBiomarker[index].reference!.valueA.toString() +
                                                    " - " +
                                                    customBiomarker[index].reference!.valueB.toString() +
                                                    " " +
                                                    store.state.unitList!.units!
                                                        .firstWhere(
                                                            (element) => element.id == customBiomarker[index].reference!.unitId)
                                                        .content!
                                                        .shorthand!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .merge(TextStyle(color: BioMadColors.base[500], fontWeight: FontWeight.normal))),
                                            Container(
                                              width: 22,
                                              height: 22,
                                              child: FittedBox(
                                                  alignment: Alignment.center,
                                                  fit: BoxFit.fitWidth,
                                                  child: IconButton(
                                                      icon: Icon(
                                                        Icons.clear,
                                                        size: 38,
                                                        color: BioMadColors.error,
                                                      ),
                                                      onPressed: () {
                                                        api.memberBiomarker.deleteReference(customBiomarker[index].id!);
                                                        setState(() {
                                                          biomarkers = getBiomarker();
                                                          _loadBiomarkers(biomarkers);
                                                        });
                                                      })),
                                            ),
                                          ])
                                        ])),
                                      ))
                                  : Container(
                                      margin: EdgeInsets.only(left: Indents.md, right: Indents.md),
                                      child: Text(
                                        _tr('null_references'),
                                        style: theme.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.normal)),
                                      )),
                              Container(
                                padding: EdgeInsets.zero,
                                width: 220,
                                child: CustomButton.flat(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AddReferenceAlertDialog(
                                          context,
                                          title: _tr('send_references'),
                                          contentPadding: EdgeInsets.symmetric(vertical: Indents.md),
                                          customBiomarker: customBiomarker,
                                        );
                                      },
                                    ).then((value) => {
                                          setState(() {
                                            biomarkers = getBiomarker();
                                            _loadBiomarkers(biomarkers);
                                          })
                                        });
                                  },
                                  text: _tr('add_references'),
                                ),
                              )
                            ]);
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: Indents.md, right: Indents.md), child: Text(_tr('null_references'))),
                            Container(
                              padding: EdgeInsets.zero,
                              width: 220,
                              child: CustomButton.flat(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddReferenceAlertDialog(context,
                                          title: "Указать референс", contentPadding: EdgeInsets.symmetric(vertical: Indents.md));
                                    },
                                  );
                                },
                                text: "Добавить или изменить",
                              ),
                            )
                          ],
                        );
                      }
                    });
              } else {
                return Container(child: Text("Обновляем референсы"));
              }
            }),
//        CustomDivider(
//          text: _tr('socials'),
//        ),
//        Padding(
//          padding: const EdgeInsets.only(bottom: Indents.sm),
//          child: StoreConnector<AppState, User>(
//            converter: (store) => store.state.user,
//            builder: (ctx, state) => Column(
//              children: [
//                for (var item in [SocialAccountProvider.google, SocialAccountProvider.facebook, SocialAccountProvider.vk])
//                  SocialAccountListTile(item)
//              ],
//            ),
//          ),
//        ),
        CustomDivider(
          text: tr('misc.other'),
        ),
        CustomListTile(
          onTap: () {
            Keys.rootNavigator.currentState!.pushReplacementNamed(Routes.auth);
            WidgetsBinding.instance!.addPostFrameCallback((x) => store.dispatch(StoreThunks.logOut()));
          },
          prepend: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: Indents.md),
                  child: CustomCircleAvatar(
                      radius: AvatarSizes.md,
                      backgroundColor: theme.primaryColor.withOpacity(ColorAlphas.a10),
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
